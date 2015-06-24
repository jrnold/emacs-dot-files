;; update themes
(defvar color-theme-light 'solarized-light)
(defvar color-theme-dark 'solarized-dark)
(defvar color-theme-default color-theme-light)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic nil)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)


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
