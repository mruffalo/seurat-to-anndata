#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: DockerRequirement
    dockerImageId: mruffalo/mtx_to_anndata

inputs:
  mtx_file:
    type: File
    inputBinding:
      position: 0
  barcodes_file:
    type: File
    inputBinding:
      position: 1
  genes_file:
    type: File
    inputBinding:
      position: 2

outputs:
  anndata_file:
    type: File
    outputBinding:
      glob: out.h5ad

baseCommand: ['python3', '/opt/mtx_to_anndata.py']
