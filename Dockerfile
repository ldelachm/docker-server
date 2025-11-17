# Copyright 2020-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied.
# See the License for the specific language governing permissions and limitations under the License.
FROM public.ecr.aws/ubuntu/ubuntu:20.04 AS core

ARG DEBIAN_FRONTEND="noninteractive"

# Install git, SSH, Git, Firefox, GeckoDriver, Chrome, ChromeDriver,  stunnel, AWS Tools, configure SSM, AWS CLI v2, env tools for runtimes: Dotnet, NodeJS, Ruby, Python, PHP, Java, Go, .NET, Powershell Core,  Docker, Composer, and other utilities
# COMMAND REDACTED FOR BREVITY
# Activate runtime versions specific to image version.
#RUN n $NODE_14_VERSION
#RUN pyenv  global $PYTHON_39_VERSION
# RUN phpenv global $PHP_80_VERSION
# RUN rbenv  global $RUBY_27_VERSION
#RUN goenv global  $GOLANG_15_VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    ssh \
    curl \
    wget \
    unzip \
    zip \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    python3 \
    python3-pip \
    python3-dev \
    nodejs \
    npm \
    default-jdk \
    maven \
    gradle \
    php \
    php-curl \
    php-xml \
    php-mysql \
    php-mbstring \
    php-zip \
    ruby \
    ruby-dev \
    postgresql \
    mysql-server \
    mongodb \
    redis-server \
    nginx \
    apache2 \
    vim \
    emacs \
    nano \
    git-lfs \
    imagemagick \
    ffmpeg \
    shellcheck \
    locales \
    fonts-liberation \
    netcat \
    iputils-ping \
    traceroute \
    sqlite3 \
    mercurial \
    subversion \
    cmake \
    clang \
    gcc \
    g++ \
    gdb \
    valgrind \
    latex-full \
    texlive-full \
    gimp \
    inkscape \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    matplotlib \
    scikit-learn \
    tensorflow \
    torch \
    jupyter \
    pytest \
    pylint \
    black \
    mypy \
    flask \
    django \
    requests \
    beautifulsoup4 \
    selenium

# Configure SSH
# COPY ssh_config /root/.ssh/config
# COPY runtimes.yml /codebuild/image/config/runtimes.yml
# COPY dockerd-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh
# COPY legal/bill_of_material.txt /usr/share/doc/bill_of_material.txt
# COPY amazon-ssm-agent.json /etc/amazon/ssm/amazon-ssm-agent.json

# ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
