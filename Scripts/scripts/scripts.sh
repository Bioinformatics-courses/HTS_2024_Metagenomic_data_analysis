#!/bin/bash

# Downloading datasets

wget https://zenodo.org/record/7818827/files/ERR2231568_1.fastqsanger.gz
wget https://zenodo.org/record/7818827/files/ERR2231568_2.fastqsanger.gz

# Streamline code by assigning each data or sample to a read
read1=fastq/ERR2231568_1.fastqsanger.gz
read2=fastq/ERR2231568_2.fastqsanger.gz

# Find the number of contigs for the sample
grep '>'megahit_results/final.contigs.fa | wc -l

# Evaluation of the Assembly

metaquast -o metaquast_results --thtreads 8 megahit_result_results/final.contigs.fa

# Used Icarus contig browser to visualize the assessment based on the output from QUAST

# Visualize de novo assembly using bandage
megahit_toolkit contig2fastg 91 megahit_results/intermediate_contigs/k91.contigs.fa

# Visualize assembly graph using bandage
Bandage
 
