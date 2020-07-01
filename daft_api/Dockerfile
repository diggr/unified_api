FROM python:3.7-stretch

RUN apt update && apt install -y \
    git

RUN pip --version

RUN mkdir /src && \
    cd /src && \
    git clone https://github.com/diggr/provit && \
    git clone -b develop https://github.com/diggr/daft && \
    git clone https://github.com/diggr/diggrtoolbox && \
    cd /src/provit && \
    pip install . && \
    cd /src/diggrtoolbox && \
    pip install . && \
    cd /src/daft && \
    pip install -r requirements.txt && \
    pip install .

COPY data /data

WORKDIR /data/tools/daft

ENTRYPOINT ["daft", "api", "--host=0.0.0.0", "--no-debug"]
