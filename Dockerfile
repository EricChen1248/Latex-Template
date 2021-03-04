FROM tianon/latex
LABEL description="Modded tianon"
RUN apt-get update -y && \
    apt-get install -y python-pygments && \
    rm -rf /var/lib/apt/lists/*