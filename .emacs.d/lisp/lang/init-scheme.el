;;; init-scheme.el --- Initialise Scheme config  -*- lexical-binding: t; -*-


;; https://nongnu.org/geiser/   https://gitlab.com/jaor/geiser
(use-package geiser
  :ensure t
  :config
  (setq scheme-program-name "chez")
  (setq geiser-chez-binary "chez")
  (setq geiser-active-implementations '(chez))
  (add-hook 'scheme-mode-hook 'geiser-mode))


(provide 'init-scheme)


;;; init-scheme.el ends here
