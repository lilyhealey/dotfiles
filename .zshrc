# typeset -A colours;
# colours=(reset, )

# colours
reset=$'%{\e[0;0m%}';
black=$'%{\e[0;30m%}';
red=$'%{\e[0;31m%}';
green=$'%{\e[0;32m%}';
yellow=$'%{\e[0;33m%}';
blue=$'%{\e[0;34m%}';
purple=$'%{\e[0;35m%}';
cyan=$'%{\e[0;36m%}'; # reserved for orange
ltgray=$'%{\e[0;37m%}';
dkgray=$'%{\e[0;90m%}';
bred=$'%{\e[0;91m%}';
bgreen=$'%{\e[0;92m%}';
byellow=$'%{\e[0;93m%}';
bblue=$'%{\e[0;94m%}';
bpurple=$'%{\e[0;95m%}';
bcyan=$'%{\e[0;96m%}'; # reserved for orange
white=$'%{\e[0;97m%}';

# %! = current history event number
PS1="${bcyan}%!. ";

# %n = $USERNAME
PS1+="${bgreen}%n";

# literal @ symbol
PS1+="${green}@";

# %m = the hostname up to the first `.'. An integer may folow the `%' to
# specify how many components of the hostname are desired. With a negative
# integer, trailing components of the hostname are shown.
PS1+="${bgreen}%m"

# literal colon
PS1+="${reset}:";

# %~ = current working directory, but if the current working directory starts
# with $HOME, that part is replaced by a `~'. Furthermore, if it has a named 
# directory as its prefix, that part is replaced by a `~' followed by the name
# of the directory, but only if the result is shorter than the full path.
PS1+="${byellow}%1~";

# reset all the things
PS1+="${reset}";

PS1+=$'\n$ ';

AUTO="/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f $AUTO ]; then 
  source $AUTO
fi

export LANG=en_GB.UTF-8
# export PS1="\$ "

if [ -x /usr/local/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
    # show all
  # use colorised output
  # formatting file timestamps:
  # https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
    alias ls='gls -a --color=auto --quoting-style=literal'
    alias dir='gdir --color=auto'
    alias vdir='gvdir --color=auto'

    # alias grep='grep --color=auto'
    # alias fgrep='fgrep --color=auto'
    # alias egrep='egrep --color=auto'
else
  # long format
  # follow symbolic links
  # use unit suffixes: B, K, M, G, T
  alias ls="ls -aG" #--color=tty"
fi
