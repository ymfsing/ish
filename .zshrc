# Initialize command prompt
export PS1="[%T] %n : %~ %# "


# Enable 256 color to make auto-suggestions look nice
export TERM="xterm-256color"


# zinit   https://github.com/zdharma/zinit#option-2---manual-installation
# Initialize zinit

# source zinit
source ~/.zinit/bin/zinit.zsh

# http://www.aloxaf.com/2019/11/zplugin_tutorial/

# zsh-quotify
# zinit light dpretet/zsh-quotify

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# https://unix.stackexchange.com/questions/383365/zsh-compinit-insecure-directories-run-compaudit-for-list
# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh

# web search
zinit light ymfsing/web-search

# forgit
zinit light wfxr/forgit


# alias
# ll
alias ll='ls -al'
# cp
alias cp='cp -i'
# bat
alias cat='bat'
# z.lua
alias zc='z -c'      # 严格匹配当前路径的子路径
alias zz='z -i'      # 使用交互式选择模式
alias zf='z -I'      # 使用 fzf 对多个结果进行选择
# emacs
alias emc='emacsclient'
alias emt='emacs -Q -l ~/.emacs.d/init-test.el'
# git
alias gitd='git diff'
alias gits='git status'
alias gitc='git clone --depth 1 --recursive'
alias gitsa='git submodule add'
alias gitsi='git submodule init'
alias gitsu='git submodule update --remote'
alias gitsri='git submodule update --recursive --init'
alias gitrc='git rm -r --cached .'
alias gitci='git check-ignore -v'


# function
# git
function gitacp() {
    git add .
    git commit -m "$1"
    git push -u origin main
}

function gitbrn() {
    git branch -av
    git branch -m master  main
    git push origin main
    git push --delete origin master
    gitacp "branch rename"
}

# https://gist.github.com/sharplet/6289697   https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule
function gitsrm() {
    submodule_name=$(echo "$1" | sed 's/\/$//')

    if git submodule status "$submodule_name" >/dev/null 2>&1; then
        git submodule deinit -f "$submodule_name"
        rm -rf ".git/modules/$submodule_name"
        rm -rf "$submodule_name"
        git rm -f "$submodule_name"
    else
        echo "Submodule '$submodule_name' not found"
    fi
}

# emacs
# https://emacs-china.org/t/topic/5507
function empath() {
    sh -c 'printf "%s" "$PATH"' > ~/.emacs.d/.path
}

# elisp ert
# https://www.emacswiki.org/emacs/ErtTestLibrary
function elert() {
    emacs -batch -l ert -l $1 -f ert-run-tests-batch-and-exit
}

# config
# bat
export BAT_THEME="Solarized (dark)"

# z.lua
export _ZL_MATCH_MODE=1
