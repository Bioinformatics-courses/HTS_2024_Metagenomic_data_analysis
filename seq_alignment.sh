#!/bin/bash


# List of fastq files
FASTQ_FILES=(
	
	"ER2231568_1.fastqsanger.gz"
	"ERR2231568_2.fastqsanger.gz"
)

# Reference genome 
REFERENCE="reference_genome.fasta"

# Align paired-end reads
for ((i=0; i<${#FASTQ_FILES[@]}; i+=2)); do
	SAMPLE=$(basename ${FASTQ_FILES[i]} "_1.fastqsanger.gz")
	bwa mem $REFERENCE ${FASTQ_FILES[i]} ${FASTQ_FILES[i+1]} | samtools view -sb -> ${SAMPLE}.bam
done

# Sort and index the bam files
for BAM in *.bam; do
	samtools sort -o sorted_$BAM $BAM
	samtools index sorted_$BAm
done

echo "Alignment and processing complete"

