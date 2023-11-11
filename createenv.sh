#!/bin/bash

# # Il percorso in cui Anaconda è stato installato (modifica se necessario)
# ANACONDA_PATH="$HOME/anaconda3"

# # Verifica se il percorso di Anaconda è già nel PATH
# if [[ ":$PATH:" != *":$ANACONDA_PATH/bin:"* ]]; then
#     # Aggiunge il percorso di Anaconda al PATH nel file .bashrc
#     echo "Aggiungo Anaconda al PATH nel file .bashrc"
#     echo -e "\n# Aggiunge Anaconda al PATH" >> ~/.bashrc
#     echo "export PATH=\"$ANACONDA_PATH/bin:\$PATH\"" >> ~/.bashrc
    
#     # Ricarica .bashrc per applicare le modifiche
#     source ~/.bashrc

#     echo "Anaconda è stato aggiunto al tuo PATH."
# else
#     echo "Anaconda è già nel PATH."
# fi

# git config --global credential.helper cache
# git config --global credential.helper 'cache --timeout=36000000'

# git config --global user.email "beltramoe@gmail.com"
# git config --global user.name "beltramoe"

wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash Anaconda3-2023.09-0-Linux-x86_64.sh -b

eval "$(conda shell.bash hook)"
conda remove -n mistral-env -y --all
conda create -n mistral-env -y python=3.10
conda activate mistral-env

conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia -y
conda install -c conda-forge fire sentencepiece -y
conda install -c xformers xformers -y

conda deactivate