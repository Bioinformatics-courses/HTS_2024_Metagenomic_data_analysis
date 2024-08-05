#!/bin/bash

# Download data for quality control assessment

wget https://zenodo.org/record/7818827/files/ERR2231568_1.fastqsanger.gz
wget https://zenodo.org/record/7818827/files/ERR2231568_2.fastqsanger.gz


# Running fastqc on the all the files
fastqc fastq/*

# One can also run fastqc for each single file 
fastq/ERR2231568_1.fastqsanger.gz ./
fastq/ERR2231568_2.fastqsanger.gz ./


