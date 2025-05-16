#!/bin/bash
set -e

sudo apt update
sudo apt install -y libfuse2 build-essential patchelf wget zsync squashfs-tools \
  libgtk-3-dev libglib2.0-dev libnss3 libxss1 libasound2 libx11-dev
sudo apt install -y tar gzip libssl-dev
sudo apt install -y unzip