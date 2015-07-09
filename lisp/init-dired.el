;; Avoid warning since ls on Mac does not support --dired option
(if (eq system-type 'gnu/linux)
    (setq dired-use-ls-dired t)
  (progn
    (setq dired-use-ls-dired nil)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)))

