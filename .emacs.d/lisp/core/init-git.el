;;; init-git.el --- git configurations -*- lexical-binding: t; -*-


;; https://github.com/magit/magit
(use-package magit
  :mode (("\\COMMIT_EDITMSG\\'" . text-mode)
         ("\\MERGE_MSG\\'" . text-mode)))


(provide 'init-git)


;;; init-dev.el ends here
