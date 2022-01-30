FROM jupyter/scipy-notebook


RUN pip3 install meson
RUN pip3 install python-chess

USER root
RUN sudo apt-get update 
RUN sudo apt upgrade -y
RUN sudo apt-get install -y git make g++ wget
RUN apt-get update && apt-get install -y libgomp1 && apt-get autoremove -y && apt-get autoclean
RUN git clone https://github.com/official-stockfish/Stockfish 
WORKDIR /home/jovyan/Stockfish/src
RUN make build ARCH=x86-64-modern
RUN mkdir -p /opt/app
RUN mv /home/jovyan/Stockfish/src/stockfish /opt/app/
RUN mv /home/jovyan/Stockfish/src/*.nnue /opt/app/
WORKDIR /home/jovyan/