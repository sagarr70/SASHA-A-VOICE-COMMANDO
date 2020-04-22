FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y python3
RUN apt-get install -qy python3-pip
WORKDIR /app
COPY . /app
RUN apt-get install -qy portaudio19-dev
RUN apt-get install -qy espeak
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update 
RUN apt-get install -qy python3-tk
RUN pip3  install -r requirements.txt

EXPOSE 5000
ENTRYPOINT [ "python3" ]
CMD [ "SASHA.py" ]


