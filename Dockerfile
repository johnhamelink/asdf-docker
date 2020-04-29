# This Dockerfile is designed to be extremely simple: it just installs the
# asdf-vm application. Users can then install their own plugins from here.
FROM alpine:latest

ARG ASDF_VERSION=0.7.8
ARG ASDF_DEPS="bash curl git"

RUN apk add --no-cache ${ASDF_DEPS}

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v${ASDF_VERSION} && \
    echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc && \
    echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

CMD ["/bin/bash"]
