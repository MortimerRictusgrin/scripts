# Descargar el instalador más reciente para Linux
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
sh /tmp/miniconda.sh -b -u -p $HOME/miniconda

# Activar el ambiente de conda a .zshrc
# echo "\"eval\" \"$($HOME/miniconda/bin/conda shell.zsh hook)\"" 

# Leer el archivo .zshrc
source ~/.zshrc

# Activar conda automáticamente
conda config --set auto_activate_base true

# Instalar jupyter
conda install -c conda-forge jupyterlab
