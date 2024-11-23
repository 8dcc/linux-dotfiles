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
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages video)
  #:use-module ((x8dcc-channel packages suckless) #:prefix x8dcc-suckless:))

(home-environment
 (packages
  (list

   ;; Desktop
   xorg-server
   xinit
   xf86-input-libinput
   xf86-video-nouveau
   xf86-video-fbdev
   x8dcc-suckless:dwm

   ;; Xorg utils
   xmodmap
   setxkbmap

   ;; Essentials
   x8dcc-suckless:dmenu
   x8dcc-suckless:slock
   x8dcc-suckless:st

   ;; Misc
   emacs
   mpv))

 (services
  (list

   ;; Add the specified directory to $PATH. Used for many scripts and some
   ;; binaries that are not packaged.
   (simple-service 'x8dcc/path-extension
                   home-environment-variables-service-type
                   '(("PATH" . "/usr/local/bin/:$PATH"))))))
