FROM python:3.8.2

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
  rm -rf /root/build


COPY requirements.txt /tmp
RUN \ 
  pip install -r /tmp/requirements.txt &&\
  jupyter labextension install @jupyterlab/toc &&\
  jupyter lab build

RUN mkdir -p /root/work
WORKDIR /root/work

COPY run-lab /usr/local/bin/run-lab
RUN chmod u+x /usr/local/bin/run-lab

CMD run-lab
