FROM python

RUN \
  mkdir -p /root/build &&\
  cd /root/build &&\
  wget https://github.com/Kitware/CMake/releases/download/v3.16.0/cmake-3.16.0.tar.gz &&\
  tar xzvf cmake-3.16.0.tar.gz &&\
  cd cmake-3.16.0 &&\
  ./bootstrap --parallel=4 &&\
  make -j4 install &&\
  apt update &&\
  apt-get install -y nodejs &&\
  apt-get install -y npm &&\
  pip install pystan &&\
  rm -rf /root/build

RUN \
  pip install \
    Cython \
    colormath \
    folium \
    gensim \
    geojson \
    h3 \
    japanize-matplotlib \
    jismesh \
    jupyterlab \
    jupyterlab-git \
    lightgbm \
    matplotlib \
    nodejs \
    numpy \
    optuna \
    pandas \
    plotly \
    python-dateutil \
    scikit-learn \
    scipy \
    seaborn \
    statsmodels \
    xgboost \
    &&\
  jupyter labextension install @jupyterlab/toc &&\
  jupyter lab build

RUN mkdir -p /root/work
WORKDIR /root/work

COPY run-lab /usr/local/bin/run-lab
RUN chmod u+x /usr/local/bin/run-lab

ENTRYPOINT run-lab
