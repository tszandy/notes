https://docs.docker.com/reference/dockerfile

ADD	Add local or remote files and directories.
ARG	Use build-time variables.
CMD	Specify default commands.
COPY	Copy files and directories.
ENTRYPOINT	Specify default executable.
ENV	Set environment variables.
EXPOSE	Describe which ports your application is listening on.
FROM	Create a new build stage from a base image.
HEALTHCHECK	Check a container's health on startup.
LABEL	Add metadata to an image.
MAINTAINER	Specify the author of an image.
ONBUILD	Specify instructions for when the image is used in a build.
RUN	Execute build commands.
    https://docs.docker.com/reference/dockerfile/#shell-and-exec-form
    # Shell form:
    RUN [OPTIONS] <command> ...
    # Exec form:
    RUN [OPTIONS] [ "<command>", ... ]
    
    https://docs.docker.com/reference/dockerfile/#run---mount
    RUN --mount

    https://docs.docker.com/reference/dockerfile/#run---network
    RUN --network

    https://docs.docker.com/reference/dockerfile/#run---security
    RUN --security

SHELL	Set the default shell of an image.
STOPSIGNAL	Specify the system call signal for exiting a container.
USER	Set user and group ID.
VOLUME	Create volume mounts.
WORKDIR	Change working directory.
