(require 'ess-site)
(require 'ess-help)

;; The indentation style is from the official R coding standards
;; R-core uses C++ http://www.cran.r-project.org/doc/manuals/R-ints.html#R-coding-standards
;; hadley uses 2 spaces.
(add-hook 'ess-mode-hook
	  '(lambda()
	     (ess-set-style 'C++ 'quiet)
	     ;; Because
	     ;;                                 DEF GNU BSD K&R C++
	     ;; ess-indent-level                  2   2   8   5   4
	     ;; ess-continued-statement-offset    2   2   8   5   4
	     ;; ess-brace-offset                  0   0  -8  -5  -4
	     ;; ess-arg-function-offset           2   4   0   0   0
	     ;; ess-expression-offset             4   2   8   5   4
	     ;; ess-else-offset                   0   0   0   0   0
	     ;; ess-close-brace-offset            0   0   0   0   0
             ))
;; No more _ to <-
(ess-toggle-underscore nil)
;; no more fancy comments
(setq ess-fancy-comments nil)

(add-hook 'Rnw-mode-hook 
	  (lambda () (setq ispell-parser 'tex)))

(defun r-scratch (buffer)
  "Open a buffer to do R work in"
  (interactive "BBuffer name: ")
  (let ((buffer-or-name (or buffer "*R-scratch*")))
    (switch-to-buffer buffer-or-name)
    (r-mode)))

;; Update ispell-latex to ignore Rnw
;; TODO

