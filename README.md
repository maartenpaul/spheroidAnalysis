# Spheroid Analysis with micro-sam

This repository contains scripts for analysis of spheroids using [micro-sam](https://github.com/computational-cell-analytics/micro-sam).

[Spheroids Microsam](images/spheroids_microsam.png)

## Scripts and Files
- convert_RGB_to8bit_.ijm
  - Fiji script used to preprocess data micro-sam which requires 8-bit images as input for the finetuning
- Make_overlays_labelMap_.ijm
  - Fiji cript to convert labelmaps to Fiji ROIs and overlay images from a set of images.
- Make_PDX_montages_.ijm
  - Fiji script to make a image montage of images in batch
- sam_finetuning_own.ipynb
  - Jupyter notebook which contains all code for finetuning of our spheroid segmentation models, run predictio on the data sets and accompanying script to extract measurements from
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