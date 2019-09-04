FROM ubuntu:xenial

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>"

RUN apt-get update && \
    apt-get install -y \
    curl \
    bzip2 \
    libfreetype6 \
    libgl1-mesa-dev \
    libglu1-mesa \
    libxi6 \
    libxrender1 \
    libasound2-dev \ 
    alsa-oss \
    libpulse-dev && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY asound.conf /etc/asound.conf

ENV BLENDER_MAJOR 2.80
ENV BLENDER_VERSION 2.80
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc217-x86_64.tar.bz2

RUN mkdir /usr/local/blender && \
    curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 && \
    tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 && \
    rm blender.tar.bz2

VOLUME /media
ADD scripts /root/
CMD /usr/local/blender/blender -b -P /root/renderServerStartup.py
EXPOSE 8000