FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      r-base \
      r-base-dev \
      pandoc \
      g++ \
      make \
      curl \
      wget \
      ca-certificates \
      gnupg \
      lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# chromium part as you have it
RUN apt-get update && \
    apt-get install -y software-properties-common gnupg && \
    add-apt-repository ppa:xtradeb/apps -y && \
    apt-get update && \
    apt-get install -y chromium && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY watchfile.sh /home/vscode/watchfile.sh
RUN chown vscode:vscode /home/vscode/watchfile.sh && \
    chmod +x /home/vscode/watchfile.sh

COPY render_cv.r /home/vscode/render_cv.r
RUN chown vscode:vscode /home/vscode/render_cv.r

RUN Rscript -e "install.packages('pagedown', repos='https://ftp.gwdg.de/pub/misc/cran/')"

CMD ["/home/vscode/watchfile.sh"]
