FROM python:3.8-buster

RUN apt-get update && \
    apt-get install -y ffmpeg sox && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY . /src
WORKDIR /src
ENTRYPOINT ["python", "download_audioset.py"]
