FROM debian:bullseye-20211011

# install dependencies
RUN apt-get update
RUN apt-get install -y make wget qemu gcc-arm-none-eabi python3 ninja-build gcc build-essential zlib1g-dev pkg-config libglib2.0-dev binutils-dev libboost-all-dev autoconf libtool libssl-dev libpixman-1-dev virtualenv

# install exact version of qemu (this takes a long time)
WORKDIR /tmp
RUN apt-get install -y git
RUN git clone --depth 1 --recurse-submodules --branch v6.2.0 https://github.com/qemu/qemu.git
WORKDIR /tmp/qemu/build
RUN ../configure
RUN make

WORKDIR /app
COPY . /app

ENV PATH=$PATH:/tmp/qemu/build