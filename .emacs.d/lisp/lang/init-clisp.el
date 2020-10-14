;;; init-clisp.el --- clisp configurations -*- lexical-binding: t; -*-

;; https://github.com/joaotavora/sly


(use-package sly
  :config
  (setq inferior-lisp-program "sbcl")
  )


(provide 'init-clisp)


;;; init-clisp.el ends here
