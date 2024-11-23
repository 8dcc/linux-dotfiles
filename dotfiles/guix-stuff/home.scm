;;------------------------------------------------------------------------------
;; This file should go in ~/.config/guix/home.scm
;;
;; Run `guix home reconfigure ~/.config/guix/home.scm' after updating it.
;;------------------------------------------------------------------------------

(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu services))

(home-environment
  (services
    (list

      ;; Add the specified directory to $PATH. Used for many
      ;; scripts and some binaries that are not packaged.
      (simple-service 'x8dcc/path-extension 
                      home-environment-variables-service-type
                      '(("PATH" . "/usr/local/bin/:$PATH"))))))
