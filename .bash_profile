# -----------------------------
# bourne again shell init file
# -----------------------------

for file in ~/.{servername,path,bash_prompt,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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

source ~/.servername

# -----------------------------
# Establish a safe environment.
# -----------------------------
# Do not log out with <ctrl-d>
set -o ignoreeof
# Do not overwrite files via '>'
set -o noclobber

# Make the sort program behave in the traditional way.
# export LC_ALL=C
