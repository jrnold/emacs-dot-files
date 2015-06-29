;; Customize company mode and company mode extensions globally
(require 'company)
(require 'company-math)

;; Global company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Activate 
(add-to-list 'company-backends 'company-math-symbols-unicode)
