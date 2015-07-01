;;  -*- no-byte-compile: t -*-
;; 
;; .emacs.el
;;
;; Global emacs init file


;; directory with local files
(defvar user-local-dir "~/.emacs.d/local")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path user-local-dir)

;; Load Packages
;; do not install cask via homebrew or need to alter next line

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;;; Autocompile files
(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode t)
(auto-compile-on-save-mode t)

;; ensure that the PATH is set
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; load stuff
(load "init-local-config" t)
(setq init-libraries
      '("init-core"
	"init-emacs-lisp"
	"init-font"
	"init-flycheck"
	"init-color-theme"
	"init-company-mode"
	;; "init-auto-complete"
        "init-tex"
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
        "init-yasnippet"
	"init-langtool"
	"init-ispell"
	"init-stan"))
(mapc 'load init-libraries)

;; Load customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))
(put 'erase-buffer 'disabled nil)
