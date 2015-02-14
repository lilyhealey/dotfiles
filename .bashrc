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

# set colours for ls
# see ls man page for colours
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
export LSCOLORS=ExhxCxcxbxdxDxfxFxgxGx

# set the terminal type so applications (e.g. emacs) use color
export TERM=xterm-color

# make the command line history ignore duplicate command lines.
history_control=ignoredups

# set the shell prompt.
# see the bash man page for a description of special characters.
# \[\e[32m\] = print following in green
# \[\e[0m\] = print following in normal
# see stftime man page for date + time formats
if [ ! "$LOGIN_SHELL" ]; then
	# '[date time]' in green 'basename of wd' in bright green
	# \D{%H:%M}
    PS1="\[\e[32m\]\#. \[\e[92m\]\W\[\e[0m\] "
fi

# Establish a safe environment.
set -o ignoreeof         # Do not log out with <ctrl-d>
set -o noclobber         # Do not overwrite files via '>'
alias rm="rm -i"         # Prompt before removing files via rm
alias cp="cp -i"         # Prompt before overwriting files via cp
alias mv="mv -i"         # Prompt before overwriting files via mv

# Create aliases for commonly used commands.
alias ls="ls -aLG" #--color=tty"
alias ll="ls -alLh" #--color=tty"
alias emacs="emacs -nw"

# Make the sort program behave in the traditional way.
export LC_ALL=C
