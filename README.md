# Spheroid Analysis with micro-sam


[![DOI](https://zenodo.org/badge/832713235.svg)](https://doi.org/10.5281/zenodo.15239559)


This repository contains scripts for analysis of spheroids using [micro-sam](https://github.com/computational-cell-analytics/micro-sam).

![Spheroids Microsam](images/spheroids_microsam.png)

## Requirements
- Fiji/ImageJ
- Python 3.8+
- CUDA-capable GPU (recommended)
- Conda package manager

## Scripts and Files
- fiji_scripts/convert_RGB_to8bit_.ijm
  - Fiji script used to preprocess data micro-sam which requires 8-bit images as input for the fine-tuning
- fiji_scripts/Make_overlays_labelMap_.ijm
  - Fiji script to convert label maps to Fiji ROIs and overlay images from a set of images.
- fiji_scripts/Make_PDX_montages_.ijm
  - Fiji script to make a image montage of images in batch
- python_scripts/randomImages.py
  - Python script to extract random images from the data sets for training micro-sam
- notebooks/sam_finetuning.ipynb
  - Jupyter notebook which contains all code for fine-tuning of our spheroid segmentation models, run prediction on the data sets and accompanying script to extract measurements from. Based on the notebook at the micro-sam repository: <https://github.com/computational-cell-analytics/micro-sam/blob/master/notebooks/sam_finetuning.ipynb>.
- environment.yml
  - Conda environment file used to run the jupyter notebook

To initiate the conda environment based on the `environment.yml` file, use the following command:

```sh
conda env create -f environment.yml -n micro-sam
conda activate micro-sam
jupyter notebook
```

## Contact
For questions concerning the code please reach out to Maarten Paul (maarten.paul@gmail.com)

## Citation

If you use this code in your research, please cite:



## License
This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.
