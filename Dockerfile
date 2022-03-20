# Dockerfile

FROM debian:stable

# install dependencies
RUN apt-get update
RUN apt-get install -y make wget qemu gcc-arm-none-eabi python3 ninja-build gcc build-essential zlib1g-dev pkg-config libglib2.0-dev binutils-dev libboost-all-dev autoconf libtool libssl-dev libpixman-1-dev virtualenv

# install exact version of qemu (this takes a long time)
# as of writing this, v6.2.0 is not available in apt-get, so I want to clone and build
WORKDIR /tmp
RUN apt-get install -y git
RUN git clone --depth 1 --recurse-submodules --branch v6.2.0 https://github.com/qemu/qemu.git
WORKDIR /tmp/qemu/build
RUN ../configure
RUN make qemu-system-arm
ENV PATH=$PATH:/tmp/qemu/build

WORKDIR /app