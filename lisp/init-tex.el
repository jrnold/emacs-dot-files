(require 'tex-site)
(require 'company-math)


;; Automatically parse 
(setq
 TeX-auto-save t
 TeX-parse-self t)

 ;; Always prompt for master document
(setq  TeX-master nil)

;; Use synctex for correlating with source
(setq TeX-source-correlate-method 'synctex
      TeX-source-correlate-mode t
      TeX-source-correlate-start-server t)

;; Misc settings
(setq
 TeX-debug-bad-boxes t
 TeX-debug-warnings t
 TeX-electric-escape t
 TeX-electric-sub-and-superscript t
 TeX-file-extensions '("tex" "sty" "cls" "ltx" "texi" "texinfo" "tikz")
 TeX-style-private '("~/.emacs.d/style")
 )

(setq
 ;; preview mode
 ;; Cache preamble without asking
 preview-auto-cache-preamble t
 preview-gs-options
  (quote
   ;; need to remove -dSAFER
   ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))
  preview-default-option-list '("displaymath" "textmath"))

;; auto-complete
;; (add-to-list 'ac-modes 'LaTeX-mode)   ; make auto-complete aware of `latex-mode`

;; (setq ac-math-unicode-in-math-p t)
;; (add-hook 'LaTeX-mode-hook
;; 	  '(lambda () 
;; 	     (setq ac-sources
;; 		   (append '(ac-source-math-unicode
;; 			     ac-source-math-latex
;; 			     ac-source-latex-commands)
;; 			   ac-sources))))


;; Add orgtbl minor mode : http://orgmode.org/manual/Orgtbl-mode.html#Orgtbl-mode
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (TeX-PDF-mode)
	     (turn-on-reftex)
	     (turn-on-orgtbl)
	     (TeX-source-correlate-mode)
             (LaTeX-math-mode)
	     (setq-local company-backends
			 (append '(company-math-symbols-latex company-latex-commands)
				 company-backends)
			 )
             ))

;; Author: TiagoCmargo, http://www.emacswiki.org/emacs/LaTeX
(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-expand-list
                  '("%(RubberPDF)"
                    (lambda ()
                      (if
                          (not TeX-PDF-mode)
                          ""
                        "--pdf"))))
     (add-to-list 'TeX-command-list
		  '("Rubber" "rubber %(RubberPDF) %t" TeX-run-shell nil t) t)))


 (defun TeX-run-Biber (name command file)
    "Create a process for NAME using COMMAND to format FILE with Biber." 
   (let ((process (TeX-run-command name command file)))
      (setq TeX-sentinel-function 'TeX-Biber-sentinel)
      (if TeX-process-asynchronous
          process
        (TeX-synchronous-sentinel name file process))))
  
  (defun TeX-Biber-sentinel (process name)
    "Cleanup TeX output buffer after running Biber."
    (goto-char (point-max))
    (cond
     ;; Check whether Biber reports any warnings or errors.
     ((re-search-backward (concat
                           "^(There \\(?:was\\|were\\) \\([0-9]+\\) "
                           "\\(warnings?\\|error messages?\\))") nil t)
      ;; Tell the user their number so that she sees whether the
      ;; situation is getting better or worse.
      (message (concat "Biber finished with %s %s. "
                       "Type `%s' to display output.")
               (match-string 1) (match-string 2)
               (substitute-command-keys
                "\\\\[TeX-recenter-output-buffer]")))
     (t
      (message (concat "Biber finished successfully. "
                       "Run LaTeX again to get citations right."))))
    (setq TeX-command-next TeX-command-default))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")))

