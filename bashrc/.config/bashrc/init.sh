# for now, I have just pasted what was in the .bashrc by default
source $BASHRC_CONFIGS/base.sh

source $BASHRC_CONFIGS/exports.sh

source $BASHRC_CONFIGS/alias.sh

# sensitive aliases where
# such as aliases that contains personal folder names and other things ...  
# such as shortcuts for certain deep nested directory that is used frequently
source $BASHRC_CONFIGS/user_aliases.sh
source $BASHRC_CONFIGS/user_sources.sh

source $BASHRC_CONFIGS/scripts.sh


# start tmux if tmux exists
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
