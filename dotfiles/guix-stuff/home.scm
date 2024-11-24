;;------------------------------------------------------------------------------
;; This file should go in ~/.config/guix/home.scm
;;
;; Run `guix home reconfigure ~/.config/guix/home.scm' after updating it.
;;------------------------------------------------------------------------------

(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages video)
  #:use-module ((x8dcc-channel packages suckless) #:prefix x8dcc-suckless:)
  #:use-module ((x8dcc-channel packages self) #:prefix x8dcc-self:)
  #:use-module ((x8dcc-channel packages fonts) #:prefix x8dcc-fonts:))

(home-environment
 (packages
  (list

   ;; Window manager. For more information on Xorg, see:
   ;; https://lists.gnu.org/archive/html/help-guix/2018-07/msg00080.html
   xorg-server
   xinit
   xf86-input-libinput
   xf86-video-nouveau
   xf86-video-fbdev
   x8dcc-suckless:dwm

   ;; Xorg utils.
   xmodmap
   setxkbmap
   xsetroot

   ;; Custom suckless builds.
   x8dcc-suckless:dmenu
   x8dcc-suckless:slock
   x8dcc-suckless:st

   ;; Fonts.
   font-cozette
   x8dcc-fonts:font-dina

   ;; Audio (amixer).
   alsa-utils

   ;; Personal utilities.
   x8dcc-self:snc
   x8dcc-self:plumber
   x8dcc-self:bin-graph

   ;; Misc.
   maim
   xclip
   feh
   syncthing
   emacs
   mpv))

 (services
  (list

   ;; Add the specified directory to $PATH. Used for many scripts and some
   ;; binaries that are not packaged.
   (simple-service 'x8dcc/path-extension
                   home-environment-variables-service-type
                   '(("PATH" . "/usr/local/bin/:$PATH"))))))
