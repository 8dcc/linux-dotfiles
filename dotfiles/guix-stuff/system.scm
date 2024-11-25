;;------------------------------------------------------------------------------
;; This file should go in ~/.config/guix/system.scm
;;
;; Run `guix system reconfigure ~/.config/guix/system.scm' after updating it.
;;------------------------------------------------------------------------------

;; TODO: Move to Org-mode, remove comments.

;; Indicate which modules to import to access the variables
;; used in this configuration.
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

 ;; The list of user accounts ('root' is implicit).
 (users
  (cons*
   (user-account
    (name "username")
    (group "username")
    (home-directory "/home/username")
    (supplementary-groups
     '("users" "wheel" "netdev" "audio" "video" "dialout")))

   ;; For 'x8dcc-suckless:slock'.
   (user-account
    (name "slock")
    (group "slock")
    (system? #t)
    (create-home-directory? #f))

   %base-user-accounts))

 (groups
  (cons*
   (user-group
    (name "username"))

   ;; For 'x8dcc-suckless:slock'.
   (user-group
    (name "slock")
    (system? #t))

   %base-groups))

 ;; Packages installed system-wide.  Users can also install packages
 ;; under their own account: use 'guix search KEYWORD' to search
 ;; for packages and 'guix install PACKAGE' to install a package.
 (packages
  (append
   (list
    (specification->package "neovim")
    (specification->package "bash-completion")
    (specification->package "man-pages")
    (specification->package "acpi")
    (specification->package "gnupg")
    (specification->package "pinentry")
    (specification->package "curl")
    (specification->package "git")
    (specification->package "gcc-toolchain")
    (specification->package "make")
    (specification->package "gdb")
    (specification->package "xxd")
    (specification->package "tree")
    (specification->package "htop")
    x8dcc-suckless:slock)
   %base-packages))

 ;; Below is the list of system services.  To search for available
 ;; services, run 'guix system search KEYWORD' in a terminal.
 (services
  (cons*
   ;; Network Time Protocol, for time and date
   (service ntp-service-type)

   ;; Login
   (service login-service-type)

   ;; Port of systemd's logind
   (service elogind-service-type)

   ;; Allow desktop users to also mount NTFS and NFS file systems without root.
   ;; NOTE: Extracted from "gnu/services/desktop.scm" @ 8a7bd211d2.
   (simple-service 'mount-setuid-helpers privileged-program-service-type
                   (map file-like->setuid-program
                        (list (file-append nfs-utils "/sbin/mount.nfs")
                              (file-append ntfs-3g "/sbin/mount.ntfs-3g"))))

   ;; OpenSSH server
   (service openssh-service-type)

   ;; Printing
   (service cups-service-type
         (cups-configuration
          (web-interface? #t)
             (extensions (list cups-filters
                               hplip-minimal))))

   ;; Connman for WiFi. We could use '(iwd) in `shepherd-requirement', but there
   ;; is currently no service that provides it.
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

   ;; Audio
   (service alsa-service-type
            (alsa-configuration
             (pulseaudio? #t)))

   ;; Configuration for Xorg
   (set-xorg-configuration
    (xorg-configuration
     (keyboard-layout keyboard-layout)))

   ;; List of special files to be symlinked. Specially useful for script
   ;; shebangs. The first to entries, for `sh' and `env', are the default.
   (service
    special-files-service-type
    `(("/bin/sh" ,(file-append bash "/bin/sh"))
      ("/usr/bin/env" ,(file-append coreutils "/bin/env"))
      ("/bin/bash" ,(file-append bash "/bin/bash"))
      ("/etc/bash_completion"
       ,(file-append bash-completion
                     "/share/bash-completion/bash_completion"))))

   ;; Base services. Note how we are using `cons*'
   %base-services))

 ;; List of privileged programs. They need the 'suid' bit, the 'guid' bit, or
 ;; some specific capability. For more information, see:
 ;;   - https://guix.gnu.org/manual/devel/en/guix.html#Privileged-Programs
 ;;   - setuid(3p)
 ;;   - setgid(3p)
 ;;   - capabilities(7)
 (privileged-programs
  (cons*
   (privileged-program
    (program (file-append x8dcc-suckless:slock "/bin/slock"))

    ;; The user needs to be root (instead of "slock", for example) because we
    ;; will add a capability below, and all the files in '/proc/self/*' will be
    ;; owned by root. There are alternatives, but they are not worth it. See:
    ;; https://stackoverflow.com/a/50953560/11715554
    (user "root")
    (group "root")

    ;; Needed so the program gets executed as root.
    (setuid? #t)

    ;; The 'CAP_SYS_RESOURCE' capability is needed for writing to
    ;; '/proc/self/oom_score_adj', the 'CAP_SETGID' capability is needed for
    ;; setuid(2), and the 'CAP_SETGID' capability is needed for setgid(2) and
    ;; setgroups(2). See also proc_pid_oom_score(5) or simply proc(5).
    (capabilities "cap_sys_resource=eip cap_setuid=eip cap_setgid=eip"))
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

 ;; The list of file systems that get "mounted".  The unique
 ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems
  (cons* (file-system
           (mount-point "/")
           (device "/dev/mapper/guix")
           (type "ext4")
           (dependencies mapped-devices))
         (file-system
           (mount-point "/boot/efi")
           (device (uuid "XXX" 'fat32))
           (type "vfat")) %base-file-systems)))
