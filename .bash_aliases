if [[ "$ME" == "othallaptop" ]]; then
  alias sudo='sudo -E'
  alias tx='tmux -u2 -f ~/.tmux.conf'
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
fi
