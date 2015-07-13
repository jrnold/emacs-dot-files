;;; init-markdown.el --- initialize markdown related functions
;;; Commentary:
;;; Code:
(require 'markdown-mode)
;; (require 'pandoc-mode)
(require 'company)
(require 'company-math)
(require 'reftex)

;;; Code:
(defvar reftex-cite-format-markdown
      '((?\C-m . "[@%l]")
	(?k . "@%l")
	)
      "Reftex citation format compatible with pandoc markdown.")

(setq auto-mode-alist
      (append (list
	       '("\\.R?md" . gfm-mode)
               '("\\.R?markdown" . gfm-mode))
	      auto-mode-alist
	      ))

;; Enable math
(setq markdown-enable-math t)




(defun my-markdown-mode-hook()
  (define-key markdown-mode-map "\C-c["
    (lambda ()
      (interactive)
      (let ((reftex-cite-format reftex-cite-format-markdown))
	(reftex-citation))))
  (setq-local
   company-backends
   (append '(company-math-symbols-latex) company-backends))
   (setq-local company-math-allow-latex-symbols-in-faces t)
   (setq-local company-math-disallow-latex-symbols-in-faces nil)
   (setq-local company-math-allow-unicode-symbols-in-faces t)
   (setq-local company-math-disallow-unicode-symbols-in-faces nil)
   )

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

(provide 'init-markdown)
;;; init-markdown.el ends here
