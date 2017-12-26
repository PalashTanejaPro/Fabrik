#!bin/sh
# Generic dependencies
echo "Installing generic dependencies"
sudo apt-get install git libatlas-base-dev python-protobuf python-numpy python-scipy python-h5py unzip make libblas-dev liblapack-dev libatlas-base-dev gfortran python-pip python-dev
pip install numpy scipy scikit-image

#Caffe specific dependencies
echo "Installing caffe specific dependencies"
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler cmake
sudo apt-get install --no-install-recommends libboost-all-dev


echo "Installing Tensorflow dependencies"
sudo apt-get install python-pip python-dev

echo "Installing Tensorflow"
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.1-cp27-none-linux_x86_64.whl

echo "#################### Tensorflow Install Complete! ####################"

echo "Installing Theano"
pip install theano==0.9.0

echo "Installing Keras"
pip install keras==2.0.8

echo "#################### Keras Install Complete! ####################"

echo "Installing other python dependencies"
pip install -r /common.txt
