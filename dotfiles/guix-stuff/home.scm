;; Copyright 2024 8dcc. All Rights Reserved.
;;
;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along with
;; this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;; -----------------------------------------------------------------------------
;;
;; This file should go in '~/.config/guix/home.scm'. After updating it, run:
;;
;;     guix home reconfigure ~/.config/guix/home.scm
;;
;; NOTE: This source code has been generated from an Org mode file. See the
;; original repository for more information:
;; https://github.com/8dcc/linux-dotfiles

(define-module (guix-home-config)
  #:use-module (gnu home)
  ;; Packages
  #:use-module (gnu packages)
  #:use-module (gnu packages xorg)
  #:use-module ((x8dcc-channel packages suckless) #:prefix x8dcc-suckless:)
  #:use-module (gnu packages fonts)
  #:use-module ((x8dcc-channel packages fonts) #:prefix x8dcc-fonts:)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages linux)
  #:use-module ((x8dcc-channel packages self) #:prefix x8dcc-self:)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages video)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages gnuzilla)
  ;; Services
  #:use-module (gnu services)
  #:use-module (gnu home services))

(home-environment
 (packages
  (list
   xorg-server
   xinit
   xf86-input-libinput
   xf86-video-nouveau
   xf86-video-fbdev
   x8dcc-suckless:dwm
   xmodmap
   setxkbmap
   xsetroot
   x8dcc-suckless:dmenu
   x8dcc-suckless:st
   font-cozette
   x8dcc-fonts:font-dina
   aspell
   aspell-dict-en
   aspell-dict-es
   alsa-utils
   x8dcc-self:snc
   x8dcc-self:plumber
   x8dcc-self:bin-graph
   maim
   nsxiv
   mpv
   xclip
   mailutils
   syncthing
   keepassxc
   qbittorrent
   emacs
   icecat))
 (services
  (list
   (simple-service 'x8dcc/path-extension
                   home-environment-variables-service-type
                   '(("PATH" . "/usr/local/bin/:$PATH"))))))
