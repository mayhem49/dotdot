```bash
CONFIGS=$HOME/.config/
export BASHRC_CONFIGS=$CONFIGS/bashrc 
source $BASHRC_CONFIGS/init.sh
```


# using stow
- Inside stow directory, run `stow bashrc`. This will create necessary files in `.config/bashrc`.
- paste the default .bashrc files into `$CONFIGS/base.sh`
- Replace the content of bashrc file with above code.

