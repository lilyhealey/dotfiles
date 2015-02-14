for file in ~/.{bash_prompt,aliases,bashrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc;
# fi
# source ~/.bashrc