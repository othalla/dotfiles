alias tx='tmux -u2 -f ~/.tmux.conf'
alias update_virtualenv="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias gpumr="git pull upstream --rebase master"
alias gitlog="git log --graph --oneline --all"
if [[ "$ME" == "othallaptop" ]]; then
  alias sudo='sudo -E'
  # BLUETOOTH
  alias bton='sudo rfkill unblock bluetooth'
  alias btoff='sudo rfkill block bluetooth'
  # WIFI
  alias wifion='sudo rfkill unblock wlan'
  alias wifioff='sudo rfkill block wlan'
  # NOLIDSWITCH
  alias lidoff="systemd-inhibit --what=handle-lid-switch sleep infinity &"
  alias lidon="pgrep systemd-inhibit | xargs kill"
  alias pycharm="/opt/pycharm-community-2017.1.2/bin/pycharm.sh"
  alias ls="ls --group-directories-first --color=auto"
  alias ll="ls --group-directories-first --color=auto -la"
elif [[ "$OS" == "FreeBSD" ]]; then
  alias ls="ls -G"
  alias ll="ls -laG"
  alias zdf="zfs list -o name,mounted,mountpoint,used,logicalused,usedbydataset,usedbychildren,usedbysnapshots,quota,reservation,usedbyrefreservation,dedup,compression,refcompressratio"
  alias cpuinfo="sysctl hw.model hw.machine hw.ncpu"
fi

HUB_PATH="$(which hub)"
[ -n "$HUB_PATH" ] && alias git="$HUB_PATH"
