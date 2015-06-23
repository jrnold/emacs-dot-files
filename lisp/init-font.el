;; font and highlighting
(require 'dash)

;; From http://www.emacswiki.org/emacs/SetFonts
(defun font-candidate (fonts)
    "Return the first available font."
    (--first (find-font (font-spec :name it)) fonts)
    )

(defvar default-font-list 
  '("InputMonoLight-10"
    "SourceCodePro-10",
    "Incosolata-11"
    "DejaVuSansMono-10"
    "Menlo-10")
  "List of default fonts to try to use")
  
(set-default-font (font-candidate default-font-list) t)
(global-font-lock-mode 3)
