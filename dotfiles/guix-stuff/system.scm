;;------------------------------------------------------------------------------
;; This file should go in ~/.config/guix/system.scm
;;
;; Run `guix system reconfigure ~/.config/guix/system.scm' after updating it.
;;------------------------------------------------------------------------------

;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu) (nongnu packages linux))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
 (kernel linux)
 (firmware (list linux-firmware))
 (locale "en_US.utf8")
 (timezone "XXX")
 (keyboard-layout (keyboard-layout "XXX"))
 (host-name "XXX")

 ;; The list of user accounts ('root' is implicit).
 (users (cons* (user-account
                (name "username")
                (comment "username")
                (group "users")
                (home-directory "/home/username")
                (supplementary-groups '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))

 ;; Packages installed system-wide.  Users can also install packages
 ;; under their own account: use 'guix search KEYWORD' to search
 ;; for packages and 'guix install PACKAGE' to install a package.
 (packages (append (list (specification->package "neovim")
                         (specification->package "bash-completion")
                         (specification->package "git")
                         (specification->package "curl")
                         (specification->package "gcc-toolchain")
                         (specification->package "make")
                         (specification->package "gdb")
                         (specification->package "xxd")
                         (specification->package "htop")
                         (specification->package "openbox"))
                   %base-packages))

 ;; Below is the list of system services.  To search for available
 ;; services, run 'guix system search KEYWORD' in a terminal.
 (services
  (append (list (service openssh-service-type)
                (service cups-service-type)
                (service connman-service-type)
                (set-xorg-configuration
                 (xorg-configuration (keyboard-layout keyboard-layout))))

          ;; FIXME: It might be honestly better to remove `desktop-services'
          ;; altogether and just add the useful packages manually.
          (filter (lambda (serv)
                    (not (member (service-kind serv)
                                 (list gdm-service-type ; FIXME: Not getting removed
                                       network-manager-service-type
                                       modem-manager-service-type))))
                  %desktop-services)))
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))
 (swap-devices (list (swap-space
                      (target (uuid
                               "XXX")))))
 (mapped-devices (list (mapped-device
                        (source (uuid
                                 "XXX"))
                        (target "guix")
                        (type luks-device-mapping))))

 ;; The list of file systems that get "mounted".  The unique
 ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems (cons* (file-system
                       (mount-point "/")
                       (device "/dev/mapper/guix")
                       (type "ext4")
                       (dependencies mapped-devices))
                      (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "XXX"
                                     'fat32))
                       (type "vfat")) %base-file-systems)))
