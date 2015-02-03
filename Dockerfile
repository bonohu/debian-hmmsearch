#Docker container for hmmsearch

FROM debian

MAINTAINER Hidemasa Bono, bonohu@gmail.com

# File add
ADD Sod_Cu.hmm Sod_Cu.hmm

# Install packages
RUN apt-get update && \
    apt-get install -y hmmer &&\
    apt-get install -y wget &&\
    rm -rf /var/lib/apt/lists/*
RUN wget ftp://ftp.ensemblgenomes.org/pub/metazoa/release-25/fasta/tribolium_castaneum/pep/Tribolium_castaneum.Tcas3.25.pep.all.fa.gz
CMD ["hmmsearch", "Sod_Cu.hmm", "Tribolium_castaneum.Tcas3.25.pep.all.fa.gz"]

