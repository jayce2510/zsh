#!/bin/bash

#Install ZSH and Oh My ZSH
apt update && apt install zsh -y 

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yes