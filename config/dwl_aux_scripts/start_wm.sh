#!/bin/sh
export XDG_CURRENT_DESKTOP=wlroots # sets the desktop environment to be used by
                                   # the current session, which, since dwl has
                                   # no specific portal, is wlroots which dwl is
                                   # based on
                                   
export MOZ_ENABLE_WAYLAND=1 # forces firefox to use wayland
export MOZ_DISABLE_RDD_SANDBOX=1 # allows firefox to use nvidia specific
                                 # hardware acceleration 

export QT_QPA_PLATFORM=wayland # forces qt applications to use the wayland backend

export SDL_VIDEODRIVER=wayland # sets the video driver for "Simple DirectMedia
                               # Layer" (SDL), which is used to expose low level
                               # access to, among other things, graphics
                               # hardware to applications. 
export _JAVA_AWT_WM_NONREPARENTING=1 # makes java handles windows that don't get
                                     # reparented in window managers that lack
                                     # the behaviour, which is the case for dwl 
dwl -s "/etc/dwl_aux_scripts/dwl_startup.sh"
