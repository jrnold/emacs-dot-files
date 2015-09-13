;;; init.el --- init file for jrnold
;;  -*- no-byte-compile: t -*-
;;
;;; Commentary:
;; 
;; Global emacs init file

;;; Code:

(defvar cask-file "~/.cask/cask.el"
  "Path to cask.el.")
(require 'cask cask-file)
(cask-initialize)
(require 'pallet)

;;; Autocompile files
;; (setq load-prefer-newer t)
;; (require 'auto-compile)
;; (auto-compile-on-load-mode t)
;; (auto-compile-on-save-mode t)

;; Add paths for directories with init files
(defvar init-local-dir
  (concat user-emacs-directory "local")
  "User directory with local files.")
(add-to-list 'load-path init-local-dir)

(defvar init-library-dir
  (concat user-emacs-directory "lisp")
  "User directory with libraries in init.")
(add-to-list 'load-path init-library-dir)

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
	"init-stan"
        "init-yasnippet"
	"init-langtool"
	"init-ispell"
	"init-polymode"
        "init-dired"
        "init-occur"))
(mapc 'load init-libraries)

(defun init-reload ()
  "Reload the user init file."
  (interactive)
  (load user-init-file))

;; Load customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))

(provide 'init)
;;; init.el ends here
