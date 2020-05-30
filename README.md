image_rebase
==============

Description
-----------

`image_rebase` allows you to change base image of existing Docker images without using `docker build`.

Key Benefits
------------ 
* Very fast – no layers are downloaded or uploaded. No containers are started or commands being executed. Only JSON manipulation is performed.
* Docker Registry will not bloat due to added layers.
* Communicates directly to Docker Registry - Docker Engine isn't required. 
 
It supports different modes of operation.

### Automatic base image detection (recommended)

This mode is the simplest to use but requires you to change your Dockerfiles by adding FROM LABEL. It must be the first command (after FROM directive):
    
    FROM myrepo/base_image:base_tag
    LABEL FROM=base_image:base_tag
    # rest of Dockerfile

This should be done for images being rebased. Changing base images is not required. 
Then to rebase your image execute: 

`image_rebase $registry_url myimage:mytag`. 

This command will:
* Lookup name of base image of `myimage:mytag` which is `base_image:base_tag`.
* Check if image `base_image:base_tag` has been changed since creation of `myimage:mytag`.
* Create new image if necessary and upload it to the registry under same tag. 

### Manually specifying base image

This mode does not require you to change Dockerfile. But you need to specify exact version of previous base image and new base image:

`image_rebase $registry_url myimage:mytag --from-base base_image:base_tag --to-base base_image:new_base_tag`

Note that `base_image:base_tag` must point to the same version of base image that was used during build of myimage. Otherwise the script will fail. 
Digest of image may be used instead of it's tag: `base_image@sha256:XXXX`

It is possible to change non-direct base image. E.g. if there is hierarchy of images A->B->C, it is possible to create new image having another version of A.

### Manually specifying number of layers

Instead of base image you can also specify number of history layers of myimage to copy. It could be the only way if manifest of base image used to create myimage have been already deleted.
You can retrieve history using `docker inspect <image>` and count numbers of commands added to myimage after base image. This is the most unsafe way and should be used carefully:

`image_rebase $registry_url myimage:mytag --layers 3 --to-base base_image:new_base_tag`

### Other flags

`-t`, `--tag`: save new image under different tag

`--force`: forces overwriting existing target image 

### Limitations

* Docker Registry authentication is not supported
* Support for Dockerfile commands for rebasing images is limited. However these limitations do not apply to base images - only to images that are derived from them. 
List of currently supported commands:
    * CMD
    * ENTRYPOINT
    * ADD
    * COPY
    * USER
    * WORKDIR
    * RUN commands are not re-executed by design. Their result is be reused from old image.
    * EXPOSE, ENV and LABEL are supported with single argument only. E.g. `ENV A=B C=D` not supported

Prerequisites
-----------
* [Python 3.x](https://www.python.org/downloads/)
* [Docker Registry V2](https://docs.docker.com/registry/)   


Examples
----------------
See `samples` directory for examples.
