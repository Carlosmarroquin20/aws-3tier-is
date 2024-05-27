#!/bin/bash

# Run system update
apt-get update

# install curl
apt install curl -y

# install tar
apt install tar -y


# Github Hosted Runner
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz
# Optional: Validate the hash
echo "d62de2400eeeacd195db91e2ff011bfb646cd5d85545e81d8f78c436183e09a8  actions-runner-linux-x64-2.316.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz

# Create the runner and start the configuration experience
export RUNNER_ALLOW_RUNASROOT="1"
export SERVERNAME="das-deploy"
./config.sh --url https://github.com/Carlosmarroquin20/PG_DAS --token AOORKGCBY6JBKQBJ2OTURKLGKQG3C --name webserver-$(echo $SERVERNAME) --labels $(echo $SERVERNAME) --unattended
# Last step, run it!
nohup ./run.sh > /dev/null 2>&1 &