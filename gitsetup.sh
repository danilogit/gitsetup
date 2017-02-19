#!/bin/bash

# Install Git
sudo apt-get install git

# Configure terminal
echo "parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'}" >> ~/.bashrc
echo 'PS1="\n\e[33;1m\u@\h: \e[1;34m\W\e[0m\[\033[33m\]\$(parse_git_branch)\[\033[00m\] (\w)\n\$ "' >> ~/.bashrc

# Install DiffMerge
wget http://download-us.sourcegear.com/DiffMerge/4.2.0/diffmerge_4.2.0.697.stable_amd64.deb
sudo dpkg -i diffmerge_4.2.0.697.stable_amd64.deb
rm diffmerge_4.2.0.697.stable_amd64.deb

# Configure MergeTools
git config --global diff.tool diffmerge
git config --global difftool.diffmerge.cmd "/usr/bin/diffmerge \"\$LOCAL\" \"\$REMOTE\""
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.trustExitCode true
git config --global mergetool.diffmerge.cmd "/usr/bin/diffmerge --merge --result=\"\$MERGED\" \"\$LOCAL\" \"\$BASE\" \"\$REMOTE\""
