#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: DockerRequirement
    dockerImageId: mruffalo/seurat_to_mtx

inputs:
  rdata_file:
    type: File
    inputBinding:
      position: 0

outputs:
  mtx_file:
    type: File
    outputBinding:
      glob: matrix.mtx
  barcodes_file:
    type: File
    outputBinding:
      glob: barcodes.txt
  genes_file:
    type: File
    outputBinding:
      glob: genes.txt

baseCommand: ['Rscript', '/opt/seurat_to_mtx.R']
