#!/bin/bash
  
#Install p10k theme & autosuggestions & zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/zsh-syntax-highlighting

echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

source ${ZSH_CUSTOM:-~}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Edit ZSH config file
sed -i 's\ZSH_THEME="robbyrussell"\ZSH_THEME="powerlevel10k/powerlevel10k"\' ${ZDOTDIR:-$HOME}/.zshrc

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ${ZDOTDIR:-$HOME}/.zshrc

echo "ZSH_HIGHLIGHT_STYLES[path]=none" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "ZSH_HIGHLIGHT_STYLES[path_prefix]=none" >> ${ZDOTDIR:-$HOME}/.zshrc

#Restart ZSH and set up
exec zsh