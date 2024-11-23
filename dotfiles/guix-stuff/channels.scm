;;------------------------------------------------------------------------------
;; This file should go in ~/.config/guix/channels.scm
;;
;; Run `guix pull' after updating it.
;;------------------------------------------------------------------------------

(cons*
 (channel
  (name 'x8dcc-channel)
  (url "https://github.com/8dcc/guix-channel")
  (introduction
   (make-channel-introduction
    "ba5e7eef57c8e4ecc43bf223c7ed9610d18c3d41"
    (openpgp-fingerprint
     "D44F 386E FF1A 1A2F A405  5E84 228C 1049 6531 7F9A"))))
 (channel
  (name 'nonguix)
  (url "https://gitlab.com/nonguix/nonguix")
  (introduction
   (make-channel-introduction
    "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
    (openpgp-fingerprint
     "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
 %default-channels)
