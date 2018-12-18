# -----------------------------
# bourne again shell init file
# -----------------------------

# load all the other init files
for file in ~/.{path,bash_prompt,exports,aliases,git-completion.bash}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc;
# fi
# source ~/.bashrc

# do global configuration
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

# -----------------------------
# Establish a safe environment.
# -----------------------------
# Do not log out with <ctrl-d>
set -o ignoreeof
# Do not overwrite files via '>'
set -o noclobber

# Make the sort program behave in the traditional way.
# export LC_ALL=C

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
