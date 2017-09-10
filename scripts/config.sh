# this configure file defines some install option
# 1: install it
# 0: nope

export INSTALL_ZEPPELIN=1

# the follow 3 options are based on miniconda
export INSTALL_THEANO=1
export INSTALL_PYTORCH=1
export INSTALL_TENSORFLOW=0


export INSTALL_IPYTHON=1

############################

export INSTALL_CONDA=0

if [[ $INSTALL_THEANO == "1" ]]; then
  INSTALL_CONDA=1
fi

if [[ $INSTALL_PYTORCH == "1" ]]; then
  INSTALL_CONDA=1
fi

if [[ $INSTALL_TENSORFLOW == "1" ]]; then
  INSTALL_CONDA=1
fi

if [[ $INSTALL_IPYTHON == "1" ]]; then
  INSTALL_CONDA=1
fi

