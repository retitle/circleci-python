FROM circleci/python:3.6.5

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

RUN sudo apt-get update && sudo apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN curl -o- -L https://yarnpkg.com/install.sh | bash || true

# Convox
WORKDIR /usr/local/bin
RUN sudo curl -L https://convox.com/cli/linux/convox -o ./convox && sudo chmod +x ./convox

# Clean up
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
