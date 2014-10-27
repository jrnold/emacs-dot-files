(global-linum-mode)
(setq fill-column 80)
(if (fboundp 'menu-bar-mode) (menu-bar-mode t))
(transient-mark-mode 1)
(setq delete-selection-mode t)
(setq column-number-mode t)
(setq indicate-empty-lines t)
(setq inhibit-startup-screen t)

;; Set printer to environment variable
(setq printer-name (getenv "PRINTER"))

;; keybindings
;; I always accidentally type these
;; text-scale-increase
(global-unset-key (kbd "C-+"))
;; text-scale-decrease
(global-unset-key (kbd "C--"))
;; I too often accidentally try to send mail
(global-unset-key (kbd "C-x m"))

;; aliases
(defalias 'qrr 'query-replace-regexp)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq auto-mode-alist
       (delq (rassq 'doc-view-mode auto-mode-alist) auto-mode-alist))

(global-auto-revert-mode 1)

