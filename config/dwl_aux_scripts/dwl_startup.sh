/etc/dwl_aux_scripts/start_quickshell.sh

# Import the Wayland environment into systemd
systemctl --user import-environment WAYLAND_DISPLAY
systemctl --user set-environment XDG_CURRENT_DESKTOP=wlroots

# also update the DBus activation environment[citation:3]
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
fi

# Restart the portal services but now with the wayland environment set up
# propperly
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-wlr
