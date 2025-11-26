# Look for conda in known locations (miniconda or anaconda)
for d in "$HOME/miniconda3" "$HOME/anaconda3"; do
    if [ -d "$d" ]; then __conda_root="$d"; break; fi
done


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${__conda_root}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${__conda_root}/etc/profile.d/conda.sh" ]; then
        . "${__conda_root}/etc/profile.d/conda.sh"
    else
        export PATH="${__conda_root}/bin:$PATH"
    fi
fi
unset __conda_setup

# Automatically activate environment
if command -v conda >/dev/null 2>&1; then
    conda activate pydata
fi

