#!/bin/bash
#
# Liquidprompt
#
# Install Liquidprompt: https://github.com/nojhan/liquidprompt

mkdir -p ~/Projects/liquidprompt
cd ~/Projects/liquidprompt/
curl -LO https://github.com/nojhan/liquidprompt/archive/master.zip
unzip master.zip
rm master.zip

mkdir -p ~/.bashrc.d/
echo "[[ \$- = *i* ]] && source ~/Projects/liquidprompt/liquidprompt" > ~/.bashrc.d/liquidprompt.bashrc
