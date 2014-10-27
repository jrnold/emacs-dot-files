;; (require 'color-theme-solarized)
(defvar color-theme-light 'solarized-light)
(defvar color-theme-dark 'solarized-dark)
(defvar color-theme-default color-theme-light)

;; Load theme even when run as daemon
;; http://stackoverflow.com/questions/18904529/after-emacs-deamon-i-can-not-see-new-theme-in-emacsclient-frame-it-works-fr
(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
                (load-theme color-theme-default t))))
  (load-theme color-theme-default t))

(defvar color-theme-dark-loadedp
  (eq color-theme-dark color-theme-default)
  "Is the dark theme loaded")

;; Dark/light toggling
;; Adapted from ideas in http://www.emacswiki.org/emacs/ColorTheme#toc16
(defun toggle-dark-light-color-theme ()
  "Switch to/from dark light colro theme"
  (interactive)
  (if color-theme-dark-loadedp
      (progn
	(load-theme color-theme-light)
	(setq color-theme-dark-loadedp nil))
    (load-theme color-theme-dark)
    (setq color-theme-dark-loadedp t)))
