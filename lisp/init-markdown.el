(require 'markdown-mode)
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
  (local-set-key
   (define-key markdown-mode-map "\C-c["
    (lambda ()
      (nteractive)
      (let ((reftex-cite-format reftex-cite-format-markdown))
	(reftex-citation)))))

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
