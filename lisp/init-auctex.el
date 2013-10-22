(require 'tex-site)

(setq
 TeX-auto-save t
 TeX-parse-self t
 ;; Always prompt for master
 TeX-master nil
 TeX-source-correlate-method 'synctex
 ;; LaTeX-command-style (quote (("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))))
 TeX-debug-bad-boxes t
 TeX-debug-warnings t
 TeX-electric-escape t
 TeX-electric-sub-and-superscript t
 TeX-file-extensions '("Snw" "Rnw" "Rtex" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo" "tikz")
 ;; Correlate source
 TeX-source-correlate-method (quote synctex)
 TeX-source-correlate-mode t
 TeX-source-correlate-start-server t
 ;; Viewer Programs
 TeX-view-program-list 
 '(("Okular" "okular --unique %o#src:%n\"`pwd`/./%b\"")
   ("Evince" "evince --page-index=%(outpage) %o"))
 TeX-view-program-selection  (quote ((output-pdf "Okular") 
                                     (output-html "xdg-open")
                                     (output-dvi "Okular") 
                                     ))
 
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
  preview-default-option-list '("displaymath" "textmath")
  )

;; Add orgtbl minor mode : http://orgmode.org/manual/Orgtbl-mode.html#Orgtbl-mode
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (TeX-PDF-mode)
	     (turn-on-reftex)
	     (turn-on-orgtbl)
	     (TeX-source-correlate-mode)
             (LaTeX-math-mode)
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
