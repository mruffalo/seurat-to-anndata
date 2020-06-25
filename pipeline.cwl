#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: v1.0

inputs:
  rdata_file:
    type: File

outputs:
  anndata_file:
    type: File 
    outputSource: mtx_to_anndata/anndata_file

steps:
  seurat_to_mtx:
    run: steps/seurat_to_mtx.cwl
    in: rdata_file
    out: [mtx_file, row_list_file, col_list_file]

  mtx_to_anndata:
    run: steps/mtx_to_anndata.cwl
    in:
      mtx_file:
        source: seurat_to_mtx/mtx_file
      barcodes_file:
        source: seurat_to_mtx/barcodes_file
      genes_file:
        source: seurat_to_mtx/genes_file
    out: [anndata_file]
