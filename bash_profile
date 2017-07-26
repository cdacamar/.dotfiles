export PATH=~/bin/:~/.gem/ruby/2.4.0/bin:$PATH

#colors
export RED='\e[1;31m'
export GREEN='\e[1;32m'
export YELLOW='\e[1;33m'
export BLUE='\e[1;34m'
export NULL='\e[m'

PS1="[\[$RED\]\W>\[$NULL\]] "

#setup vbox mount
alias vboxsetup='sudo modprobe -a vboxguest vboxsf vboxvideo'
alias vboxmount='sudo mount -t vboxsf C_DRIVE /mnt'

# quickpath
alias bootloader='cd ~/projects/svn/trunk/capsher/products/boot_loader'
alias enpro='cd ~/projects/svn/trunk/projects/enpro/SmartIOT'
alias tti='cd ~/projects/svn/trunk/projects/tti/goldeneye'
alias cbout='cd ~/projects/baseline_out/Products'

#ls alias
alias dir='dir --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias lx='ls -X'
alias cls='clear;ls'
alias rls='reset;ls'
alias lal='ls -la'

#data moving
alias mv='mv -i'
alias cp='cp -i'

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
alias grep='grep --color=always'
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
