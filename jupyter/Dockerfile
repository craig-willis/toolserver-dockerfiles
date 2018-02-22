FROM jupyter/scipy-notebook

USER root

RUN apt-get update -y && \
    #apt-get install -y sqlite3 libopencv-dev python-matplotlib octave gnuplot && \
    # install a package into the default (python 3.x) environment
    conda install -c conda-forge cartopy gdal gnuplot matplotlib metpy netcdf4  octave octave_kernel opencv siphon xarray && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN bash -c "source activate python2; conda install opencv -y" && \
    cd / && git clone https://github.com/danforthcenter/plantcv.git && \
    cd /plantcv && \
    bash -c "source activate python2; python setup.py install" 

USER $NB_USER
COPY start-notebook.sh /usr/local/bin/

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
