



;; function from http://www.emacswiki.org/emacs/FindingNonAsciiCharacters 
(global-set-key (kbd "C-c o") 'occur)

(defun occur-non-ascii ()
  "Find any non-ascii characters in the current buffer."
  (interactive)
  (occur "[^[:ascii:]]"))
