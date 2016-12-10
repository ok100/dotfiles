#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|

# Antigen
source /usr/share/zsh/scripts/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle virtualenvwrapper
antigen bundle sudo

antigen apply

# Aliases
alias :q="exit"
alias sub="subberthehut -l cze -s"
alias ls="/usr/bin/vendor_perl/ls++"
alias l="ls -la"
alias u="yaourt -Syu --aur"

# Gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ }

source ~/.profile
workon_cwd
