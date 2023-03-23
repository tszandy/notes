Install list

sudo mkdir -p /opt/adas/3rdparty


# install ceres
sudo apt-get install autoconf \
automake \
build-essential \
clang \
clang-format \
cmake \
cmake-curses-gui \
curl \
g++ \
git \
gitk  \
google-mock \
kcachegrind \
libboost-all-dev \
libc++-dev \
libcairo2-dev \
libeigen3-dev \
libgflags-dev \
libgtest-dev \
libgoogle-glog-dev \
liblua5.2-dev \
libsuitesparse-dev \
libtool \
make \
meld \
ninja-build \
python-rosdep \
python-sphinx
python-wstool \
stow \
unzip \
valgrind


sudo apt-get install libatlas-base-dev
sudo add-apt-repository ppa:bzindovic/suitesparse-bugfix-1319687
sudo apt-get update
sudo apt-get install libsuitesparse-dev


cd ~/Downloads
git clone https://ceres-solver.googlesource.com/ceres-solver
mkdir ceres-bin
cd ceres-bin
sudo mkdir -p /opt/adas/3rdparty/ceres-solver
cmake ../ceres-solver -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/ceres-solver"
make -j3
make test
sudo make install


# install ctpl
cd ~/Downloads
git clone git://git.tuxfamily.org/gitroot/ctpl/ctpl.git
cd ctpl
sudo mkdir -p /opt/adas/3rdparty/ctpl
cat README(auto-complete) # for instruction
./waf configure --prefix="/opt/adas/3rdparty/ctpl"
sudo ./waf build
sudo ./waf install


# install gtsam
cd ~/Downloads
git clone https://github.com/borglab/gtsam.git
cd gtsam
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/gtsam"
make check
sudo make install


# install Rply
cd ~/Downloads
wget http://w3.impa.br/~diego/software/rply/rply-1.1.4.tar.gz
tar -zxvf rply-1.1.4.tar.gz
cd rply-1.1.4
sudo mkdir -p /opt/adas/3rdparty/rply/include/rply
sudo cp rply.h /opt/adas/3rdparty/rply/include/rply/rply.h
sudo mkdir -p /opt/adas/3rdparty/rply/lib/rply
sudo cp rply.c /opt/adas/3rdparty/rply/lib/rply/rply.c

# install fortran
sudo apt-get update; sudo apt-get install gfortran

# install HSL MA21 solver
go to http://www.hsl.rl.ac.uk/ipopt/ get free version of hsl
cd ~/Downloads
tar -zxvf coinhsl-archive-2014.01.17.tar.gz 
cd coinhsl-archive-2014.01.17.tar.gz 
./configure
make
sudo make install


# install Ipopt
cd ~/Downloads
wget https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.7.zip
unzip Ipopt-3.12.7.zip
cd Ipopt-3.12.7/ThirdParty/HSL
ln -s ../../../coinhsl-archive-2014.01.17/ coinhsl
cd ~/Downloads/Ipopt-3.12.7
./configure --enable-loadable-library
make
sudo make test
sudo make install
sudo mkdir -p /opt/adas/3rdparty/Ipopt/lib
cd lib && sudo cp -r * /opt/adas/3rdparty/Ipopt/lib/ && cd ..
sudo mkdir -p /opt/adas/3rdparty/Ipopt/include
cd include && sudo cp -r * /opt/adas/3rdparty/Ipopt/include/ && cd ..
sudo ldconfig

# install opencv 4.5.0
cd ~/Downloads
wget https://github.com/opencv/opencv/archive/4.5.0.zip
unzip 4.5.0.zip 
cd opencv-4.5.0
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/opt/adas/3rdparty/opencv ..
make -j7 # runs 7 jobs in parallel
sudo make install
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j7 # runs 7 jobs in parallel
sudo make install


# install eigen
cd ~/Downloads
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.8/eigen-3.3.8.zip
unzip eigen-3.3.8.zip
cd eigen-3.3.8
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/eigen3"
make
sudo make install

# install qpOASES
cd ~/Downloads
git clone https://github.com/coin-or/qpOASES.git
cd qpOASES
# modify CMakeLists.txt
ADD_LIBRARY(qpOASES STATIC ${SRC})
to
ADD_LIBRARY(qpOASES SHARED ${SRC})
mkdir build && cd build
# cmake ..
cmake .. -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/qpOASES"
make
sudo make install

# install Nanoflann
cd ~/Downloads
git clone https://github.com/jlblancoc/nanoflann.git
cd nanoflann
mkdir build && cd build
# cmake ..
cmake .. -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/nanoflann"
make
sudo make install
sudo mkdir -p /opt/adas/3rdparty/nanoflann/include/nanoflann
sudo mv /opt/adas/3rdparty/nanoflann/include/nanoflann.hpp /opt/adas/3rdparty/nanoflann/include/nanoflann/nanoflann.hpp

# install CANlib
# install driver first
cd ~/Downloads
wget --content-disposition "https://www.kvaser.com/download/?utm_source=software&utm_ean=7330130980754&utm_status=latest"
tar xvzf linuxcan.tar.gz
cd linuxcan
make
sudo make install
sudo make load

sudo apt-get install libxml2-dev \
libssl-dev \
zlib1g-dev

wget --content-disposition "https://www.kvaser.com/download/?utm_source=software&utm_ean=7330130981966&utm_status=latest"
tar xvzf kvlibsdk.tar.gz
cd kvlibsdk
make --prefix="/opt/adas/3rdparty/linuxcan"
make check
sudo make install


# install CppAD
cd ~/Downloads
git clone https://github.com/coin-or/CppAD.git
cd CppAD
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX="/opt/adas/3rdparty/cppad"
make
sudo make install

# install CppAD
sudo apt-get update -y
sudo apt-get install -y cppad

# install FastRtps
cd ~/Downloads
git clone --recursive https://github.com/eProsima/Fast-RTPS.git -b 1.8.x ~/FastRTPS-1.8.2
cd ~/FastRTPS-1.8.2
mkdir build && cd build
cmake -DTHIRDPARTY=ON -DSECURITY=ON --prefix="/opt/adas/3rdparty/Fast-RTPS-1.8.2" ..
make
sudo make install

# issue Could NOT find Protobuf (missing: PROTOBUF_INCLUDE_DIRS PROTOBUF_LIBRARIES)
cd ~/Downloads
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf/
git checkout v3.5.2
./autogen.sh
./configure --prefix="/opt/adas/3rdparty/protobuf"
make
make check
sudo make install
sudo ldconfig


# install glew
sudo apt update
sudo apt install libglew


# install glfw
sudo apt-get update
sudo apt-get install libglfw3
sudo apt-get install libglfw3-dev

# install tensorRT
cd ~/Downloads
git clone https://github.com/NVIDIA/TensorRT.git
cd TensorRT
git submodule update --init --recursive
export TRT_SOURCE=`pwd`

cd $TRT_SOURCE
mkdir -p build && cd build
cmake .. -DTRT_LIB_DIR=$TRT_RELEASE/lib -DTRT_OUT_DIR=`pwd`/out
make -j$(nproc)

# install protoc
PROTOC_ZIP=protoc-3.7.1-linux-x86_64.zip
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/$PROTOC_ZIP
sudo unzip -o $PROTOC_ZIP -d /opt/adas/3rdparty/protoc bin/protoc
sudo unzip -o $PROTOC_ZIP -d /opt/adas/3rdparty/protoc 'include/*'
rm -f $PROTOC_ZIP

# install yaml-cpp
sudo apt update
sudo apt install libyaml-cpp-dev

# install jsoncpp
sudo apt-get install libjsoncpp-dev

# install XercesC
sudo apt-get update -y
sudo apt-get install -y libxerces-c-dev


# install adas_dds
go to http://www.rti.com/downloads/connext-files.html and downloads


# install ffmpeg
sudo apt-get install nasm libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev

cd ~/Downloads
wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ffmpeg/7:4.3.1-5ubuntu1/ffmpeg_4.3.1.orig.tar.xz
tar -xvf ffmpeg_4.3.1.orig.tar.xz
cd ffmpeg_4.3.1
./configure
make
make install
