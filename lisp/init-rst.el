(require 'reftex)
(require 'rst)

(setq reftex-cite-format-rst 
      '((?\C-m . "[@%l]_")))

(defun rst-mode-reftex-setup ()
  (interactive)
  (load-library "reftex")
  (and (buffer-file-name) 
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key rst-mode-map "\C-c["
    (lambda ()
      (interactive)
      (let ((reftex-cite-format reftex-cite-format-rst))
	(reftex-citation)))))

(setq auto-mode-alist 
      (append (list
	       '("\\.R?rst" . rst-mode)
               '("\\.rest" . rst-mode))
	      auto-mode-alist))

(add-hook 'rst-adjust-hook 'rst-toc-update)
(add-hook 'rst-mode-hook 
	  '(lambda () 
	     ;; (turn-on-cdlatex)
	     (rst-mode-reftex-setup)))
