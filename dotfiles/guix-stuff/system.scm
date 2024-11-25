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
;; This file should go in '~/.config/guix/system.scm'. After updating it, run:
;;
;;     guix system reconfigure ~/.config/guix/system.scm
;;
;; NOTE: This source code has been generated from an Org mode file. See the
;; original repository for more information:
;; https://github.com/8dcc/linux-dotfiles

(use-modules (gnu)
             (gnu system privilege)
             (gnu system setuid)
             (gnu services base)
             (gnu services pm)
             (gnu services networking)
             (gnu services ssh)
             (gnu services cups)
             (gnu services sound)
             (gnu services xorg)
             (gnu services desktop)
             (gnu packages nfs)
             (gnu packages cups)
             (gnu packages linux)
             (gnu packages bash)
             (gnu packages man)
             ((x8dcc-channel packages suckless) #:prefix x8dcc-suckless:)
             (nongnu packages linux))

(operating-system
 (kernel linux)
 (firmware (list linux-firmware))
 (locale "en_US.utf8")
 (timezone "XXX")
 (keyboard-layout (keyboard-layout "XXX"))
 (host-name "XXX")
 (users
  (cons*
   (user-account
    (name "username")
    (group "username")
    (home-directory "/home/username")
    (supplementary-groups
     '("users" "wheel" "netdev" "audio" "video" "dialout")))
   (user-account
    (name "slock")
    (group "slock")
    (system? #t)
    (create-home-directory? #f))
   ;; Prepend users to:
   %base-user-accounts))
 (groups
  (cons*
   (user-group
    (name "username"))
   (user-group
    (name "slock")
    (system? #t))
   ;; Prepend groups to:
   %base-groups))
 (packages
  (cons*
   (specification->package "neovim")
   (specification->package "curl")
   (specification->package "man-pages")
   (specification->package "acpi")
   (specification->package "tree")
   (specification->package "htop")
   (specification->package "gnupg")
   (specification->package "pinentry")
   (specification->package "git")
   (specification->package "gcc-toolchain")
   (specification->package "make")
   (specification->package "gdb")
   (specification->package "xxd")
   (specification->package "bash-completion")
   x8dcc-suckless:slock
   ;; Prepend packages to:
   %base-packages))
 (services
  (cons*
   (service ntp-service-type)
   (service login-service-type)
   (service elogind-service-type)
   (simple-service 'mount-setuid-helpers privileged-program-service-type
                   (map file-like->setuid-program
                        (list (file-append nfs-utils "/sbin/mount.nfs")
                              (file-append ntfs-3g "/sbin/mount.ntfs-3g"))))
   (service openssh-service-type)
   (service cups-service-type
            (cups-configuration
             (web-interface? #t)
             (extensions (list cups-filters
                               hplip-minimal))))
   (service wpa-supplicant-service-type)
   (service connman-service-type
            (connman-configuration
             (shepherd-requirement '(wpa-supplicant))
             (disable-vpn? #t)
             (general-configuration
              (connman-general-configuration
               (allow-hostname-updates? #f)
               (allow-domainname-updates? #f)
               (single-connected-technology? #f)))))
   (service alsa-service-type
            (alsa-configuration
             (pulseaudio? #t)))
   (set-xorg-configuration
    (xorg-configuration
     (keyboard-layout keyboard-layout)))
   (extra-special-file "/bin/bash" (file-append bash "/bin/bash"))
   (extra-special-file
    "/etc/bash_completion"
    (file-append bash-completion "/share/bash-completion/bash_completion"))
   ;; Prepend services to:
   %base-services))
 (privileged-programs
  (cons*
   (privileged-program
    (program (file-append x8dcc-suckless:slock "/bin/slock"))
    (user "root")
    (group "root")
    (setuid? #t)
    (capabilities "cap_sys_resource=eip cap_setuid=eip cap_setgid=eip"))
   ;; Prepend privileged programs to:
   %default-privileged-programs))
 (bootloader
  (bootloader-configuration
   (bootloader grub-efi-bootloader)
   (targets (list "/boot/efi"))
   (keyboard-layout keyboard-layout)))
 (swap-devices
  (list (swap-space
         (target (uuid "XXX")))))
 (mapped-devices
  (list (mapped-device
         (source (uuid "XXX"))
         (target "guix")
         (type luks-device-mapping))))
 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device "/dev/mapper/guix")
          (type "ext4")
          (dependencies mapped-devices))
         (file-system
          (mount-point "/boot/efi")
          (device (uuid "XXX" 'fat32))
          (type "vfat"))
         ;; Prepend file systems to:
         %base-file-systems)))
