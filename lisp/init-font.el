;; font and highlighting
(require 'dash)

;; From http://www.emacswiki.org/emacs/SetFonts
(defun font-candidate (fonts)
    "Return the first available font."
    (--first (find-font (font-spec :name it)) fonts)
    )

(defvar default-font-list 
  '("InputMonoLight-11"
    "SourceCodePro-11"
    "Incosolata-12"
    "DejaVuSansMono-11"
    "Menlo-11"
    "Consolas-11")
  "List of default fonts to try to use")
  
(set-default-font (font-candidate default-font-list) t)
(global-font-lock-mode 3)

(provide 'init-font)
