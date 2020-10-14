;; init-org.el --- Initialize org configurations.	-*- lexical-binding: t -*-


(use-package org
  :config
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/inbox.org")))


(provide 'init-org)


;;; init-org.el ends here
