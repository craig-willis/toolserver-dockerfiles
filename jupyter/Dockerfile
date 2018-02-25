FROM jupyter/minimal-notebook

USER root

RUN apt-get update -y && \
    #apt-get install -y sqlite3 libopencv-dev python-matplotlib octave gnuplot && \
    # install a package into the default (python 3.x) environment
    conda install -c conda-forge cartopy gdal gnuplot matplotlib=2.1.1 metpy netcdf4=1.3.1  octave octave_kernel numpy=1.12.1 opencv pkgconfig psycopg2 rasterio scipy=1.0.0 siphon texinfo xarray && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#RUN bash -c "source activate python2; conda install opencv -y" && \
#    cd / && git clone https://github.com/danforthcenter/plantcv.git && \
#    cd /plantcv && \
#    bash -c "source activate python2; python setup.py install" 

#RUN  cd / && git clone https://github.com/danforthcenter/plantcv.git && \
#     cd /plantcv && \
#     python setup.py install

RUN cd / && git clone https://github.com/craig-willis/terrautils -b datadrivenag && \
    cd /terrautils && \
    pip install -r requirements.txt


ENV PYTHONPATH $PYTHONPATH:/terrautils
USER $NB_USER
COPY start-notebook.sh /usr/local/bin/

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
