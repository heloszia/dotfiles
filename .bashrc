# BASHPROMPT


PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[36m\]'       # change to cyan
PS1="$PS1"'\u@\h '             # user@host<space>
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
PS1="$PS1"'\[\033[35m\]'       # change purple
PS1="$PS1"'$(parse_git_branch)\012'  # git branch
PS1="$PS1"'\[\033[1;37m\]'     # change to white 
PS1="$PS1"'$ '                 # prompt: always $
MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

# LS COLORS
LS_COLORS='di=36:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

# ALIAS
alias killvs='taskkill -IM devenv.exe -F'
alias startsln='find -maxdepth 2 -name *sln -exec start {} \;'
alias subl='C:\\Program\ Files\\Sublime\ Text\ 3\\sublime_text.exe'
alias codegen='C:\\CodeGenerator\\Code\ Generieren.bat'
alias udfgen='C:\\CodeGenerator\\UDF\ Generieren.bat'
alias gs='git status'
alias gd='git diff'
alias gm='cd /C/Git/majesty'
alias ls='ls --color=auto'
alias cm='git checkout master'
alias appsetgen='C:\\Git\\Majesty\\UBS.References\\AppSettingsCodeGenerator.exe'
alias designersort='C:\\Git\\Majesty.DesignerSort\\DesignerSort\\bin\\Release\\DesignerSort.exe'
alias washabeichdiesewochegemacht='git log --all --pretty=format:"%s %C(6)%ad" --relative-date --branches --remotes --date-order --abbrev-commit --date=relative --since="1 week ago" --author=akos.ludl@ub-software.de'

export VISUAL=vim
export EDITOR="$VISUAL"

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# apply git command on regex filtered list of files from git status
function ge()
{
	git status | grep $2 | sed 's/^.modified:   //' | xargs git $1
}


function parse_git_branch()
{
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

