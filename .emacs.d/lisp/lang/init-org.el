;; init-org.el --- Initialize org configurations.	-*- lexical-binding: t -*-


(use-package org
  :config
  (setq org-directory "~/Documents/org")
  (setq org-default-notes-file (concat org-directory "/inbox.org")))


(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Documents/org/roam")
  :config
  (setq org-roam-db-gc-threhold most-positive-fixnum))


(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (require 'org-roam-protocol))


(provide 'init-org)


;;; init-org.el ends here
