FROM localhost:5000/centos:7
EXPOSE 2000
ENV IMAGE_DESCRIPTION="New base image"
ENV TEST=Successfully\ rebased\ to\ base2!!!
ENTRYPOINT ["bash","-c"]
CMD ["echo IMAGE_DESCRIPTION=$IMAGE_DESCRIPTION && echo TEST=$TEST && cat test.txt /etc/centos-release"]
