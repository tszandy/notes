# Anaconda command notes

conda create -n python3 python=3.6
conda remove --name python3 --all

conda env list

conda activate environment_name
conda env export > environment_name.yml

conda env create -f environment.yml

conda env create --name mouse --file=mouse.yml

pip install numpy
pip install ipython
pip install jupyter
pip install sklearn
pip install opencv-python
pip install pandas

conda remove --name mouse --all
conda env create -f mouse.yml


