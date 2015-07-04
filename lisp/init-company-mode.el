;;; init-company-mode.el --- initialize company mode related settings
;;; Commentary:
;;; Code:

;; Customize company mode and company mode extensions globally
(require 'company)
(require 'company-math)

;; Activate
(add-to-list 'company-backends 'company-math-symbols-unicode)

;; Global company mode
(add-hook 'after-init-hook 'global-company-mode)


(provide 'init-company-mode)
;;; init-company-mode.el ends here
