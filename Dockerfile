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
RUN n $NODE_14_VERSION
RUN pyenv  global $PYTHON_39_VERSION
RUN phpenv global $PHP_80_VERSION
RUN rbenv  global $RUBY_27_VERSION
RUN goenv global  $GOLANG_15_VERSION

# Configure SSH
COPY ssh_config /root/.ssh/config
COPY runtimes.yml /codebuild/image/config/runtimes.yml
COPY dockerd-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh
COPY legal/bill_of_material.txt /usr/share/doc/bill_of_material.txt
COPY amazon-ssm-agent.json /etc/amazon/ssm/amazon-ssm-agent.json

ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
