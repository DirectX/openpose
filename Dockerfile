FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y cmake git libatlas-base-dev libgoogle-glog-dev libopencv-dev python-opencv python-pip
RUN apt-get install -y libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev
RUN apt-get install -y libprotobuf-dev protobuf-compiler libhdf5-dev

RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git
WORKDIR openpose
RUN mkdir build
RUN cd build && cmake -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 -DCUDA_NVCC_EXECUTABLE=/usr/local/cuda-8.0 -DCUDA_INCLUDE_DIRS=/usr/local/cuda-8.0 -DCUDA_CUDART_LIBRARY=/usr/local/cuda-8.0 .. && make

CMD tail -f /dev/null
