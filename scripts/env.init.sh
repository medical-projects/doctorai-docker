#!/usr/bin/env bash
source /etc/profile
source /etc/bashrc

# zeppelin

(! id -u zeppelin > dev/null 2>&1 ) && adduser zeppelin #
echo "download zeppelin..."
wget http://archive.apache.org/dist/zeppelin/zeppelin-0.7.1/zeppelin-0.7.1-bin-netinst.tgz
echo "extract zeppelin..."
tar -xzf zeppelin-0.7.1-bin-netinst.tgz
echo "rm zeppelin.tgz..."
rm -f zeppelin-0.7.1-bin-netinst.tgz
echo "instgall interpreters"
/zeppelin-0.7.1-bin-netinst/bin/install-interpreter.sh --name md
/zeppelin-0.7.1-bin-netinst/bin/install-interpreter.sh --name python
mv zeppelin-0.7.1-bin-netinst /usr/local/
ln -sf /usr/local/zeppelin-0.7.1-bin-netinst /usr/local/zeppelin

echo 'export PATH=/usr/local/zeppelin/bin:$PATH' >> /etc/bashrc

echo "zeppelin success"

# miniconda
echo "downloading miniconda"
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p /usr/local/mc && rm -rf miniconda.sh
export PATH=/usr/local/mc/bin:$PATH
echo 'export PATH=/usr/local/mc/bin:$PATH' >> /etc/bashrc

# theano
conda install --yes numpy theano ipython


# pytorch
export CMAKE_PREFIX_PATH=/usr/local/mc

# Install basic dependencies
conda install --yes numpy pyyaml mkl setuptools cmake gcc cffi

# Add LAPACK support for the GPU
#conda install -c soumith magma-cuda80 # or magma-cuda75 if CUDA 7.5

wget https://github.com/pytorch/pytorch/archive/v0.1.12.tar.gz -O pytorch.tgz
tar -xzvf pytorch.tgz
mv pytorch-0.1.12 /usr/local/src
(cd /usr/local/src/pytorch-0.1.12 && python setup.py install)
rm -f pytorch.tgz

# for https://github.com/pytorch/examples/tree/master/imagenet
pip install torchvision

# tf
conda install --yes tensorflow

# bug fix
pip install py4j

echo "miniconda success"


# cleanup self
rm -f /env_init.sh

