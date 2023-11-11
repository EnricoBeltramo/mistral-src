#!/bin/bash

# wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
# bash Anaconda3-2023.09-0-Linux-x86_64.sh -b
# rm -rf Anaconda3-2023.09-0-Linux-x86_64.sh
# echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
# source ~/.bashrc

# eval "$(conda shell.bash hook)"
# conda init

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000000'

git config --global user.email "beltramoe@gmail.com"
git config --global user.name "beltramoe"

eval "$(conda shell.bash hook)"
conda remove -n mistral-env -y --all
conda create -n mistral-env -y python=3.10
conda activate mistral-env

conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia -y
conda install -c conda-forge fire sentencepiece -y
conda install -c xformers xformers -y

conda deactivate