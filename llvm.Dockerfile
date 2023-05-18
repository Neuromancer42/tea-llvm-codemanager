FROM ubuntu:20.04 as base
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && \
	apt-get -y install --no-install-recommends \
	autoconf \
	automake \
	bash-completion \
    binutils \
	bison \
	build-essential \
    ca-certificates \
	clang \
	cmake \
    curl \
	doxygen \
	flex \
	g++ \
	git \
    gnupg \
    gnutls-bin \
	libffi-dev \
	libgmp-dev \
	libncurses5-dev \
	libboost-dev \
	libboost-program-options-dev \
	libtool \
	libsqlite3-dev \
    libstdc++-7-dev \
	make \
	mcpp \
    ninja-build \
    pkg-config \
	python \
    python3 \
    python3-pip \
	sqlite \
    subversion \
	sudo \
	swig \
    unzip \
	wget \
    zip \
    zlib1g \
	zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

FROM base AS llvm-builder

ARG llvm_version=15.0.7

RUN wget -qO- "https://github.com/llvm/llvm-project/releases/download/llvmorg-${llvm_version}/llvm-project-${llvm_version}.src.tar.xz" \
    | tar -xJ -C/opt

WORKDIR /tmp/llvm-project-${llvm_version}.build
RUN cmake /opt/llvm-project-${llvm_version}.src/llvm/ \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_PROJECTS="clang;lldb;lld" \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm-project-${llvm_version}.obj/ \
    && cmake --build . \
    && cmake --build . --target install

FROM base AS grpc-builder

ARG grpc_version=v1.54.0
WORKDIR /tmp
RUN git config --global http.proxy $HTTP_PROXY && git config --global https.proxy $HTTPS_PROXY
RUN git clone -b ${grpc_version} https://github.com/grpc/grpc --recurse-submodules
WORKDIR grpc/cmake/build/
RUN cmake ../.. -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/grpc-${grpc_version} \
    -DgRPC_INSTALL=ON \
    -DgRPC_BUILD_TESTS=OFF \
    -DgRPC_ZLIB_PROVIDER="package" \
    && cmake --build . \
    && cmake --build . --target install

FROM base AS tea-llvm-env

ARG llvm_version=14.0.5
ENV LLVM_DIR=/opt/llvm-project-${llvm_version}.obj
COPY --from=llvm-builder ${LLVM_DIR} ${LLVM_DIR}
ENV PATH=${LLVM_DIR}/bin:$PATH

ARG grpc_version=v1.54.0
ENV GRPC_DIR=/opt/grpc-${grpc_version}
ENV PROTOBUF_DIR=${GRPC_DIR}
COPY --from=grpc-builder ${GRPC_DIR} ${GRPC_DIR}
ENV PATH=${GRPC_DIR}/bin:$PATH

WORKDIR /ws

FROM tea-llvm-env AS tea-llvm-devenv
WORKDIR /tea
COPY tea-llvm-codemanager/ ./tea-llvm-codemanager
COPY proto/ ./proto
WORKDIR tea-llvm-codemanager

FROM tea-llvm-devenv AS tea-llvm-build
RUN cmake -S . -B cmake-build-debug -GNinja -DCMAKE_BUILD_TYPE=Debug && cmake --build cmake-build-debug
RUN cmake --install cmake-build-debug --prefix /opt/tea

FROM tea-llvm-build AS tea-llvm-codemanager
COPY --from=tea-llvm-build /opt/tea /opt/tea
WORKDIR /ws

FROM tea-llvm-devenv