;;; init-package.el --- package manager initialize  -*- lexical-binding: t; -*-
;; elpa + melpa + git submodule


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))


;; use-package
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))


;; Required by `use-package'
(use-package diminish)
(use-package bind-key)


;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)


;; auto-package-update
;; https://github.com/rranelli/auto-package-update.el
(use-package auto-package-update)


(provide 'init-package)


;;; init-package.el ends here
