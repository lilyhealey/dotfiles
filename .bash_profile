for file in ~/.{bash_prompt,bashrc,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc;
# fi
# source ~/.bashrc