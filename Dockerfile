FROM python:3.9-slim as base
LABEL maintainer="shurinov <mail@shurinov.github>"

# Dependencies
ARG BUILD_DEPS="curl iproute2 iptables iputils-ping"
RUN apt-get update && apt-get install -y $BUILD_DEPS

# poetry
#RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.2.0 POETRY_HOME=/root/poetry python3 -
#ENV PATH="${PATH}:/root/poetry/bin"



# Project init
WORKDIR /opt/test
ENTRYPOINT ["./docker-entrypoint.sh"]

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Copy project files and directories
COPY . .

RUN pip3 install -r requirements.txt

# # Install python's libs
# COPY poetry.lock pyproject.toml /
# RUN poetry config virtualenvs.create false && \
#     poetry install --no-interaction --no-ansi

