# -----------------------------------------------------------------------------
# bourne again shell init file
# -----------------------------------------------------------------------------

# load all the other init files
for file in ~/.{path,bash_prompt,exports,aliases,git-completion.bash}; do
  # -f file = true if file exists and is a regular file
  # -r file = true if file exists and is readable
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# -----------------------------------------------------------------------------
# handle nvm
# -----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

# if nvm is installed the standard way
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# if nvm is installed via homebrew

# load nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# load nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# -----------------------------------------------------------------------------
# do global configuration
# -----------------------------------------------------------------------------
ARCH=`uname -s`
CONFIGDIR='/usr/operations/lib/userconfig'
if [ -f $CONFIGDIR/bash_profile-$ARCH ]; then
   . $CONFIGDIR/bash_profile-$ARCH
fi

# IS THIS WHY LATEX WAS SO UPSET AT ME?
# set the default permission for new files to rwx------.
# umask 077

# make the command line history ignore duplicate command lines.
history_control=ignoredups

# -----------------------------------------------------------------------------
# Establish a safe environment.
# -----------------------------------------------------------------------------
# Do not log out with <ctrl-d>
set -o ignoreeof
# Do not overwrite files via '>'
set -o noclobber

# Make the sort program behave in the traditional way.
# export LC_ALL=C

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
