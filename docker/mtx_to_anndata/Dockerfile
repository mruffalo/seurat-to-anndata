FROM python:3

COPY docker/mtx_to_anndata/requirements.txt /opt
RUN python3 -m pip install -r /opt/requirements.txt

COPY bin/mtx_to_anndata.py /opt
