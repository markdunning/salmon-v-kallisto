FROM rocker/rstudio
MAINTAINER Mark Dunning <mark.dunning@cruk.cam.ac.uk>
WORKDIR /tmp
RUN wget https://github.com/COMBINE-lab/salmon/releases/download/v0.8.2/Salmon-0.8.2_linux_x86_64.tar.gz
RUN tar zxvf Salmon-0.8.2_linux_x86_64.tar.gz
RUN gunzip Salmon-0.8.2_linux_x86_64/sample_data.tgz
RUN ln -s Salmon-0.8.2_linux_x86_64/bin/salmon salmon
RUN wget https://github.com/pachterlab/kallisto/releases/download/v0.43.1/kallisto_linux-v0.43.1.tar.gz
RUN tar zxvf kallisto_linux-v0.43.1.tar.gz
RUN ln -s kallisto_linux-v0.43.1/kallisto kallisto
RUN mkdir -p /home/rstudio/kitematic/example_data/kallisto
#RUN cp kallisto_linux-v0.43.1/test/* /home/rstudio/kitematic/example_data/kallisto
RUN mkdir -p /home/rstudio/kitematic/example_data/salmon/
#RUN tar -xf Salmon-0.8.2_linux_x86_64/sample_data.tar -C /home/rstudio/kitematic/example_data/salmon/
RUN wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2-1/sratoolkit.2.8.2-1-ubuntu64.tar.gz
RUN ln -s /tmp/sratoolkit.2.8.2-1-ubuntu64/bin /usr/bin
RUN tar zxvf sratoolkit.2.8.2-1-ubuntu64.tar.gz
RUN R -e "install.packages('rmarkdown');install.packages('formatR')"
RUN R -e "source('http://www.bioconductor.org/biocLite.R');biocLite('SRAdb')"