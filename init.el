;; .emacs.el
;; Global emacs init file

;; Initial
(require 'cl)

(setq user-local-dir "~/.emacs.d/local")

;; Load ELPA packages
(require 'hippie-exp)
(require 'package)
(require 'hippie-exp)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/local")

(load-library "init-local-config")

(setq init-libraries 
      '("init-core"
        "init-auctex"
        "init-ess"
        "init-ibuffer"
        "init-markdown"
        "init-misc"
        "init-n3-mode"
        "init-octave"
        "init-org"
        "init-python"
        "init-reftex"
        "init-rst"
        "init-sql"
        "init-tramp"
        "init-w3m"
        "init-yasnippet"
	"init-langtool"
	"init-ispell"))
(mapc 'load-library init-libraries)

;; Load customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))
