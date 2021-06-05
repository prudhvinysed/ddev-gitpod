FROM gitpod/workspace-base
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update

# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip python3-crypto libxext6 libxrender1 libxtst6 libfreetype6 libxi6
# Update pip
RUN python3 -m pip install -U pip
# Install Projector
RUN sudo pip3 install projector-installer

# Install PhpStorm
# Prevents projector install from asking for the license acceptance
RUN mkdir -p ~/.projector/configs
RUN projector install 'PhpStorm 2021.1.3' --no-auto-run

# Install brew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/gitpod/.profile

# Install ddev
RUN /home/linuxbrew/.linuxbrew/bin/brew install drud/ddev/ddev

###
### Initiate a rebuild of Gitpod's image by updating this comment #1
###
