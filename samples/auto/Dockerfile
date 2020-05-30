# Example Dockerfile for auto base image detection using FROM label 
FROM localhost:5000/base:latest
LABEL FROM=base:latest
COPY test.txt /
# Overwrites parent ENV
ENV IMAGE_DESCRIPTION="Test image with embedded base image info"
EXPOSE 3000
