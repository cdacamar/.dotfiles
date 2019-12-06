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
export PROMPT_COMMAND='git_ps1;ConEmuC -StoreCWD'

export MSVC=~/Documents/MSVC/msvc

#setup vbox mount
alias vboxsetup='sudo modprobe -a vboxguest vboxsf vboxvideo'
alias vboxmount='sudo mount -t vboxsf C_DRIVE /mnt'

# git
alias st='git status'
alias co='git checkout'
alias fp='git fetch -p'
alias fe='git fetch -p && git branch -d prod/fe && git checkout prod/fe'

# quickpath
alias msvc='cd ~/Documents/MSVC/msvc'
alias contest='cd ~/Documents/MSVC/contest'
alias qa='cd ~/Documents/MSVC/msvc/src/qa/VC/FE'
alias compiler='cd ~/Documents/MSVC/msvc/src/vctools/Compiler/CxxFE/sl/p1/c'
alias ifc='cd ~/Documents/MSVC/msvc/src/vctools/Compiler/ifc'
alias msvc2='cd /e/Documents/msvc'
alias qa2='cd /e/Documents/msvc/src/qa/VC/FE'
alias compiler2='cd /e/Documents/msvc/src/vctools/Compiler/CxxFE/sl/p1/c'

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
