(require 'yasnippet)
(yas-global-mode 1)
(setq auto-mode-alist 
      (append (list
	       '("\\.yasnippet" . snippet-mode))
	      auto-mode-alist))

(defun yas/expand-by-uuid (mode uuid)
  "Exapnd snippet template in MODE by its UUID"
  (yas/expand-snippet 
   (yas/template-content 
    (yas/get-template-by-uuid mode uuid))))
