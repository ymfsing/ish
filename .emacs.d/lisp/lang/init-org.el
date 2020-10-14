;; init-org.el --- Initialize org configurations.	-*- lexical-binding: t -*-


(use-package org
  :config
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/inbox.org")))


(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/roam")
  :config
  (setq org-roam-db-gc-threhold most-positive-fixnum))


(provide 'init-org)


;;; init-org.el ends here
