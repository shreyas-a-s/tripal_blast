FROM python:3-bookworm

## Install mkdocs
RUN pip install mkdocs mkdocs-material && mkdocs --version

EXPOSE 8000

## Setup our docs
RUN mkdir tripal_blast
COPY . /tripal_blast/
WORKDIR /tripal_blast
