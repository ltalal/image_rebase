FROM localhost:5000/centos:6
LABEL FROM=centos:latest
COPY test.txt /
WORKDIR /
USER leonid.talalaev
EXPOSE 15000
ENV AAA="B C=D" C=E
CMD ["cat test.txt /etc/centos-release"]
ENTRYPOINT ["bash","-c"]

