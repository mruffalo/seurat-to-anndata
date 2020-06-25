#!/usr/bin/Rscript
library(Matrix)

args = commandArgs(trailingOnly=TRUE)
load(args[1])

genes = dimnames(sample_matrix)[[1]]
barcodes = dimnames(sample_matrix)[[2]]

writeMM(sample_matrix, 'matrix.mtx')
write.table(barcodes, 'barcodes.txt', col.names=FALSE, row.names=FALSE, quote=FALSE)
write.table(genes, 'genes.txt', col.names=FALSE, row.names=FALSE, quote=FALSE)
