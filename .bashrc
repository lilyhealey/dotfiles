# -----------------------------
# bourne again shell init file
# -----------------------------

# do global configuration
ARCH=`uname -s`
CONFIGDIR='/usr/operations/lib/userconfig'
if [ -f $CONFIGDIR/bash_profile-$ARCH ]; then
   . $CONFIGDIR/bash_profile-$ARCH
fi

# set the PATH environment variable
export PATH=/bin:$PATH
export PATH=$PATH:.

# IS THIS WHY LATEX WAS SO UPSET AT ME?
# set the default permission for new files to rwx------.
umask 077

# ---------------------------
# set colours for ls
# see ls man page for colours
# ---------------------------
# 1 directory
# 2 symbolic link
# 3 socket
# 4 pipe
# 5 executable
# 6 block special
# 7 character special
# 8 executable with setuid bit set
# 9 executable with setgid bit set
# 10 directory writeable to others, with sticky bit
# 11 directory writeable to others, without sticky bit
export LSCOLORS=ExdxCxcxbxdxDxfxFxgxGx

# set the terminal type so applications (e.g. emacs) use color
export TERM=xterm-color

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
export LC_ALL=C