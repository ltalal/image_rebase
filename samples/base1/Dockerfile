FROM localhost:5000/centos:6
EXPOSE 1000
ENV TEST=base1
ENV IMAGE_DESCRIPTION="Old base image"
ENTRYPOINT ["bash","-c"]
CMD ["echo IMAGE_DESCRIPTION=$IMAGE_DESCRIPTION && echo TEST=$TEST && cat test.txt /etc/centos-release"]

