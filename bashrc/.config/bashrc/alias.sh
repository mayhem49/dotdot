#alias
# If the last character of the alias value is a space or tab character,
# then the next command word following the alias is also checked for alias expansion.
alias sudo="sudo "

# it's just shorter
alias cls="clear"

alias vim="nvim"

# easily open certain conf files
# there are better options to do this; but it works
alias profile="nvim ~/.bashrc"
alias nvile="nvim  -c \"cd %:h\" ~/.config/nvim/init.lua  " #nv(nvim) + ile
alias tmile="nvim ~/.tmux.conf" #tm(tmux) + ile
alias hostfile="sudoedit nvim /etc/hosts"
alias emile="nvim ~/.config/alacritty/alacritty.toml"
alias gitile="nvim ~/.gitconfig"


# source bashrc
alias reload="source ~/.bashrc"

alias suspend="systemctl suspend"
alias sus="systemctl suspend"

alias initfile="nvim ~/.xinitrc"
alias postgres="sudo -iu postgres psql"


alias prolog="swipl"
alias mssql="sqlcmd -S localhost -U sa -No -P Password12"

# I think this is bad
alias docker="sudo docker"

#ls
alias lsd="ls -d */" # list directory
alias lsa="ls -a" # list all file_entries
alias lsal="ls -ahl" # list all file_entriooes with more details

# run last run command
# TODO: add for second last command too 
alias ll="fc -s"

#nvim
alias nvstart="nvim --startuptime startup.log -c exit && tail startup.log && rm startup.log"

#rm
alias rmr="rm -r"

#alias build="cls &&cmake .. && make"

#rust and cargo
#c for cargo
alias ccp="cargo clippy" # cl
alias ccl="cargo clean"

# need to define cr command in .cargo/config.toml
# it is useful to pass arguments to binary
alias cr="cargo cr"
alias ct="cargo test"
alias crun="cargo run"
alias cb=" cargo doc && cargo build"
alias crb="cargo clean && cargo doc && cargo build"



#elixir and mix
alias serve="cls && iex -S mix phx.server"
alias mixt="mix test"
alias mixf="mix format"
alias mixr="mix run"
alias mixrh="cls && mix run --no-halt"
alias mixs="cls && iex -S mix"
alias mixc="mix compile"
alias mixdb="mix ecto.drop && mix ecto.create && mix ecto.migrate --log-migrations-sql --log-migrator-sql &&   mix run priv/repo/seeds.exs "
alias credo="mix credo --format flycheck >| credo.log"



# django | python
alias penv="source myenv/bin/activate"


