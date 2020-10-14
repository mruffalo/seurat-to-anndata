#!/usr/bin/env python3
from argparse import ArgumentParser
from pathlib import Path

import anndata
import pandas as pd
import scipy.io
import scipy.sparse

def convert(rdata_file: Path, matrix_file: Path, barcodes_file: Path, genes_file: Path):
    with open(barcodes_file) as f:
        barcodes = [line.strip() for line in f]
    with open(genes_file) as f:
        genes = [line.strip() for line in f]
    matrix = scipy.io.mmread(matrix_file).T.tocsr()

    d = anndata.AnnData(
        matrix,
        obs=pd.DataFrame(index=barcodes),
        var=pd.DataFrame(index=genes),
    )

    output_path = Path(rdata_file.name).with_suffix('.h5ad')
    d.write_h5ad(output_path)

if __name__ == '__main__':
    p = ArgumentParser()
    p.add_argument('rdata_file', type=Path)
    p.add_argument('matrix_file', type=Path)
    p.add_argument('barcodes_file', type=Path)
    p.add_argument('genes_file', type=Path)
    args = p.parse_args()

    convert(args.rdata_file, args.matrix_file, args.barcodes_file, args.genes_file)
