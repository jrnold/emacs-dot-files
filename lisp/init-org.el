(require 'org)
;; (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;; suggested keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; suggested ways to use org-links outside org
;; http://orgmode.org/manual/Using-links-outside-Org.html#Using-links-outside-Org
(global-set-key "\C-cL" 'org-insert-link-global)
(global-set-key "\C-co" 'org-open-at-point-global)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (emacs-lisp . t)
   (dot . t)
   (sqlite . t)
   (sh . t)
   ))
(setq org-babel-default-header-args
      '((:session . "*R*")
	(:results . "output")
	(:exports . "both")
	(:cache . "no")
	(:noweb . "yes")
	(:hlines . "no")
	(:tangle . "no")
	(:colnames . "yes")))

;; ;; inhibit evaluation of code blocks during export
(setq org-export-babel-evaluate nil)

;; Adapted from http://orgmode.org/worg/org-tutorials/org-latex-export.html
;; (org-add-link-type "ebib" 'ebib)
;; (org-add-link-type 
;;  "cite" 'ebib
;;  (lambda (path desc format)
;;    (cond
;;     ((eq format 'html)
;;      (format "(<cite>%s</cite>)" path))
;;     ((eq format 'latex)
;;      (format "\\cite{%s}" path)))))


;; RST export for orgtbl
(defun orgtbl-to-rst-line (line)
  (apply 'format (cons *org-rst-lfmt* line)))

(defun orgtbl-to-rst (table params)
  "Convert the Orgtbl mode TABLE to ReStructuredText."
  (let* ((hline (concat
		 "+-"
		 (mapconcat (lambda (width) (apply 'string (make-list width ?-)))
			    org-table-last-column-widths "-+-")
		 "-+"))
	 (*org-rst-lfmt* (concat
			  "| "
			  (mapconcat (lambda (width) (format "%%-%ss" width))
				     org-table-last-column-widths " | ")
			  " |"))
	 (params2
	  (list
	   :tstart hline
	   :hline hline
	   :lfmt 'orgtbl-to-rst-line
	   )))
    (orgtbl-to-generic table (org-combine-plists params2 params))))

;; ;; see http://www.xemacs.org/Documentation/packages/html/reftex_4.html#SEC49
;; ;; and http://www.mfasold.net/blog/2009/02/using-emacs-org-mode-to-draft-papers/
;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name) 
;;        (file-exists-p (buffer-file-name))
;;        (reftex-parse-all))
;;   (define-key org-mode-map "\C-c["
;;     (lambda ()
;;       (interactive)
;;       (let ((reftex-cite-format reftex-cite-format-org))
;; 	(reftex-citation)))))
;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; ;; Dates and Times
;; ;; save clock history across emacs sessions
;; (setq org-clock-persist 'history)
;; (org-clock-persistence-insinuate)
;; ;; org-mode idle time
;; ;; see http://orgmode.org/manual/Link-abbreviations.html#Link-abbreviations
;; (setq org-clock-idle-time 15)
;; ;; Common org links

(setq org-link-abbrev-alist
       '(("google"   . "http://www.google.com/search?q=")
	 ("wikipedia"   . "http://en.wikipedia.org")))

(setq reftex-cite-format-org 
      '((?\C-m . "[[cite:%l][%2a (%y)]]")))

