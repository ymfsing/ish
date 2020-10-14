;;; init-yaml.el --- yaml config -*- lexical-binding: t; -*-


(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode))
  :interpreter "yaml"
  )


(provide 'init-yaml)


;;; init-yaml.el ends here
