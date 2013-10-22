(setq auto-mode-alist 
      (append (list
	       '("\\.R?md" . markdown-mode)
               '("\\.R?markdown" . markdown-mode))
	      auto-mode-alist)
      markdown-enable-math t)
