FROM python:3.7-stretch

RUN apt update && apt install -y \
    git

RUN mkdir /src && \
    cd /src && \
    git clone https://github.com/diggr/provit && \
    git clone https://github.com/diggr/koerby && \
    cd /src/provit && \
    pip install . && \
    cd /src/koerby && \
    pip install .

COPY data /data

WORKDIR /data/tools/koerby

ENTRYPOINT ["koerby", "api", "--host=0.0.0.0", "--no-debug"]

