export PATH=~/bin/:~/bin/with/:~/.gem/ruby/2.4.0/bin:$PATH

#colors
export RED='\e[1;31m'
export GREEN='\e[1;32m'
export YELLOW='\e[1;33m'
export BLUE='\e[1;34m'
export NULL='\e[m'

export PS1='$ '
function git_ps1() {
  val=`__git_ps1`
  if [ ! -z "$val" ]
  then 
    PS1="[\[$RED\]\w\[$NULL\]\[$BLUE\]"$val"\[$NULL\]]> "
  else
    PS1="[\[$RED\]\w\[$NULL\]]> "
  fi
}

#export PROMPT_COMMAND='git_ps1;ConEmuC -StoreCWD'
export PROMPT_COMMAND='git_ps1'

PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "`cygpath -w "$PWD"`"'

export MSVC2=~/Documents/MSVC/msvc
export MSVC=/d/msvc
export LIST='/d/msvc/src/qa/VC/FE/compiler/test.lst'
export UEI='/d/git_projects/UnrealEngine/Engine/Intermediate/Build/Win64/UnrealPakNonUnity/Debug'
export UE='/d/git_projects/UnrealEngine/Engine'

#setup vbox mount
alias vboxsetup='sudo modprobe -a vboxguest vboxsf vboxvideo'
alias vboxmount='sudo mount -t vboxsf C_DRIVE /mnt'

# git
alias st='git status'
alias co='git checkout'
alias fp='git fetch -p'
alias fe='git fetch -p && git branch -d prod/fe && git checkout prod/fe'
alias sup='git submodule update'
alias logp='git log --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(12,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D" --date=short'
alias git-purge='git reflog expire --expire-unreachable=now --all && git gc --prune=now'

function git-stat() {
  if [ $# -lt 1 ]
  then
    echo 'author please'
    return 1
  fi
  author="$1"
  locus=""
  if [ $# -gt 1 ] && [ ! -z "$2" ]
  then
    locus="$2"
  fi
  since=""
  if [ $# -gt 2 ] && [ ! -z "$3" ]
  then
    since="--since=$3"
  fi
  git log $since --author="$1" --pretty=tformat: --numstat $locus | awk '{inserted+=$1; deleted+=$2; delta+=$1-$2} END {printf "Commit stats:\n-  Lines added (total).... %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", inserted, deleted, delta, deleted/inserted }'
}

# quickpath
alias msvc2='cd /d/msvc_codeflow'
alias contest='cd ~/Documents/MSVC/contest'
alias qa2='cd ~/Documents/MSVC/msvc/src/qa/VC/FE'
alias compiler2='cd ~/Documents/MSVC/msvc/src/vctools/Compiler/CxxFE/sl/p1/c'
alias ifc2='cd ~/Documents/MSVC/msvc/src/vctools/Compiler/ifc'
alias msvc='cd /d/msvc'
alias qa='cd /d/msvc/src/qa/VC/FE'
alias compiler='cd /d/msvc/src/vctools/Compiler/CxxFE/sl/p1/c'
alias ifc='cd /d/msvc/src/vctools/Compiler/ifc'
alias units='cd /d/msvc/src/vctools/crt/github/tests/std/tests/P1502R1_standard_library_header_units'

#ls alias
alias dir='dir --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias lx='ls -X'
alias cls='clear;ls'
alias rls='reset;ls'
alias lal='ls -la'

#data moving
alias mvf='\mv -f'
alias mv='mv -i'
alias cpf='\cp -f'
alias cp='cp -i'

function swap() {
  if [ $# -lt 2 ]
  then
      echo 'swap takes two files'
      return 1
  fi
  lhs="$1"
  rhs="$2"
  if [ ! -f "$lhs" ]
  then
    echo "file: \"$lhs\" does not exist"
    return 1
  fi
  if [ ! -f "$rhs" ]
  then
    echo "file: \"$rhs\" does not exist"
    return 1
  fi
  mv "$lhs" "$lhs".tmp
  mv -f "$rhs" "$lhs"
  mv "$lhs".tmp "$rhs"
}


#information
alias du='du -h'
alias pcinfo='clear;date;echo;cal;
              echo -e "$BLUE"------------------------------------------------------$NULL;
              df -h; 
              echo -e "$BLUE"-------------------------------------------------------------------------$NULL;
              free;
              echo -e "$BLUE"-------------------------------------------------------------$NULL;
              w;
              echo -e "$BLUE"---------------------------$NULL;
              ps;
              echo -e "$BLUE"-------------------------------------------------------------------------------------$NULL;
              dmesg | tail -n 6'

#grep
#alias grep='grep --color=auto -i'
alias grep='grep -n --color=always'
alias egrep='egrep --color=auto'
alias psg='ps aux | grep'
alias cppgrep='~/srcsearch.sh -e "cpp|h" --color=always -n'
alias fgrep='~/bin/srcsearch --color=always -n'

#ssh
alias wyattserver='ssh cameron@ishtar.homelinux.org'
alias tcc='ssh -D 8080 cdacamar@pi.nmt.edu'
alias itweb='ssh cdacamar@itweb.cs.nmt.edu'

#umask set rxw------
umask 0077

#compile
alias clang++='clang++ -Wall -std=c++11'

#misc
[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f /etc/bash_completion.d/pacman ] && . /etc/bash_completion.d/pacman
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/oracle/11.2/client/lib/

#startx
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]
then
  exec startxfce4
fi
