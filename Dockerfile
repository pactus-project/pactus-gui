FROM arm64v8/ubuntu:22.04

RUN apt update && apt install -y \
    curl tar xz-utils unzip git \
    clang cmake ninja-build pkg-config libgtk-3-dev

ARG FLUTTER_VERSION=3.27.3
RUN curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz && \
    tar -xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz && \
    rm flutter_linux_${FLUTTER_VERSION}-stable.tar.xz

ENV PATH="/flutter/bin:${PATH}"
WORKDIR /app