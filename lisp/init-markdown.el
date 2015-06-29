(require 'markdown-mode)
(require 'cl)
(require 'pandoc-mode)

(setq reftex-cite-format-markdown
      '((?\C-m . "[@%l]")
	(?k . "@%l")
	))

(setq auto-mode-alist 
      (append (list
	       '("\\.R?md" . markdown-mode)
               '("\\.R?markdown" . markdown-mode))
	      auto-mode-alist
	      )
      markdown-enable-math t)

(defun my-markdown-mode-hook()
  (define-key markdown-mode-map "\C-c["
    (lambda ()
      (interactive)
      (let ((reftex-cite-format reftex-cite-format-markdown))
	(reftex-citation))))
  (setq-local
   company-backends
   (append '(company-math-symbols-latex)
	   company-backends)
   company-math-allow-latex-symbols-in-faces t
   company-math-disallow-latex-symbols-in-faces nil
   company-math-allow-unicode-symbols-in-faces t   
   company-math-disallow-unicode-symbols-in-faces nil
   )
  )

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
