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
(package-initialize)

(defvar my-packages
  '(auctex yaml-mode markdown-mode yasnippet langtool)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))


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
