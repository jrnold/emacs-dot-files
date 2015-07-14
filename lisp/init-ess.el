(require 'ess-site)
(require 'ess-help)

;; The indentation style is from the official R coding standards
;; R-core uses C++ http://www.cran.r-project.org/doc/manuals/R-ints.html#R-coding-standards
;; hadley uses 2 spaces.
;;                                 DEF GNU BSD K&R C++
;; ess-indent-level                  2   2   8   5   4
;; ess-continued-statement-offset    2   2   8   5   4
;; ess-brace-offset                  0   0  -8  -5  -4
;; ess-arg-function-offset           2   4   0   0   0
;; ess-expression-offset             4   2   8   5   4
;; ess-else-offset                   0   0   0   0   0
;; ess-close-brace-offset            0   0   0   0   0

(add-hook 'ess-mode-hook
	  (lambda()
	    (setq ess-indent-level 2
		  tab-width 2)))

(add-to-list 'auto-mode-alist '("\\.Rprofile\\'" . R-mode))

;; No more _ to <-
(ess-toggle-underscore nil)

;; no more fancy comments
(setq ess-fancy-comments nil)

(provide 'init-ess)
