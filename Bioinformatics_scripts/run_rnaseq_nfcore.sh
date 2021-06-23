#!/bin/bash

# working directory to read input files (fastas, genome files, and tables) and output directory to save results
# note: if reads are in another path it should be specified in the samplesheet.csv table, see example file.
WORKDIR=/path/to/data/
OUTDIR=/path/to/results/

# files:
## specifies locations of reads, replicates, conditions, and strandedness
samples=${WORKDIR%%/}/samplesheet.csv
## genomic fasta
ref_genome=${WORKDIR%%/}/GCF_000001635.27_GRCm39_genomic.fna
## GTF file
gtf_file=${WORKDIR%%/}/GCF_000001635.27_GRCm39_genomic.gtf
## table to serch and remove rRNAs (optional)
rrna_fastas=${WORKDIR%%/}/rrna-db-defaults.txt


# nf-core/rnaseq parameters, sudo permissions required for using docker profile but depends on the nextflow configuration
./nextflow run nf-core/rnaseq \
      --input $samples \
      --fasta $ref_genome \
      --gtf  $gtf_file \
      --outdir $OUTDIR \
      --remove_ribo_rna \
      --ribo_database_manifest $rrna_fastas \
      --aligner star_rsem \
      -profile docker \
      -r 3.0
    
