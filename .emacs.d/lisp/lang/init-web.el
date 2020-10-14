;;; init-web.el --- web config -*- lexical-binding: t; -*-


(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook 'company-mode))


(provide 'init-web)


;;; init-web.el ends here
