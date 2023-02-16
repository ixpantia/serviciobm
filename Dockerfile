FROM rocker/r-ver:4.1.2

RUN apt-get update && apt-get -y install \
    libxml2-dev \
    r-cran-xml \
    libcurl4-openssl-dev \
    libssl-dev \
    libsodium-dev

COPY . /app
WORKDIR /app

# Install R packages
RUN Rscript install_packages.R

EXPOSE 8080

ENTRYPOINT ["Rscript"]
CMD ["start.R"]
