export SUDO_EDITOR="nvim"

# install global packages separately in each user's home directory
# This avoids permission issues
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:~/.npm-global/bin

# I forgot for which apps this was done for
# probably snowsql?
#export PATH=~/bin:$PATH

