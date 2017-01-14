FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
        cmake gcc g++ git \
    && mkdir -p /etc/xmr-stak-cpu \
    && git clone https://github.com/RyeGuy2/xmr-stak-cpu \
    && cd xmr-stak-cpu \
    && cmake . \
    && make \
    && mv bin/xmr-stak-cpu /usr/bin/ \
    && mv config.txt /etc/xmr-stak-cpu/ \
    && rm -rf ../xmr-stak-cpu \
    && apt-get purge -y cmake gcc g++ git \
    && apt autoremove -y

CMD [ "/usr/bin/xmr-stak-cpu", "/etc/xmr-stak-cpu/config.txt" ]
