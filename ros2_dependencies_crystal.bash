#!/bin/bash

set -euf -o pipefail

echo "#/usr/lib/arm-linux-gnueabihf/libarmmem.so" > /etc/ld.so.preload

apt-get update

apt-get -y --no-install-recommends install dirmngr

echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" | tee /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

apt-get update
apt-get -y install git wget curl libxslt-dev libxml2-dev

apt -y install -q --no-install-recommends build-essential cppcheck \
  cmake libopencv-dev python-empy python3-catkin-pkg-modules python3-dev \
  python3-empy python3-nose python3-pip \
  python3-pyparsing python3-setuptools python3-vcstool \
  python3-yaml libtinyxml-dev libeigen3-dev libassimp-dev \
  libpoco-dev liblog4cxx-dev libxml2-dev


python3 -m pip install -U setuptools
apt -y install -q --no-install-recommends python3-colcon-common-extensions
apt -y install -q --no-install-recommends clang-format pydocstyle pyflakes python3-coverage python3-mock python3-pep8 uncrustify

python3 -m pip install argcomplete
pip3 install flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes pytest pytest-cov pytest-runner lark-parser
apt-get -y install -q --no-install-recommends libasio-dev libtinyxml2-dev

python3 -m pip install flake8 flake8-blind-except flake8-builtins \
                  flake8-class-newline flake8-comprehensions flake8-deprecated \
                  flake8-docstrings flake8-import-order flake8-quotes

apt -y install -q --no-install-recommends python3-pytest python3-pytest-cov python3-pytest-runner
python3 -m pip install pytest pytest-cov pytest-runner
python3 -m pip install pytest-repeat pytest-rerunfailures
apt -y install -q --no-install-recommends libasio-dev libtinyxml2-dev
apt -y install -q --no-install-recommends libexpat1-dev libpcre3-dev \
                libsqlite3-dev zlib1g-dev
apt -y install -q --no-install-recommends libcurl4-openssl-dev libfreetype6-dev \
              libgles2-mesa-dev libglu1-mesa-dev libqt5core5a libqt5gui5 \
              libqt5opengl5 libqt5widgets5 libxaw7-dev libxrandr-dev qtbase5-dev
