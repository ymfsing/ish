;;; init-company.el --- Initialize company configurations.	-*- lexical-binding: t -*-


(use-package company
  :diminish
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :commands company-abort
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 12
        company-idle-delay 0
        company-echo-delay (if (display-graphic-p) nil 0)
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-global-modes '(not erc-mode message-mode help-mode gud-mode eshell-mode shell-mode
        company-backends '(company-capf)
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))))


;; Better sorting and filtering
(use-package company-prescient
  :hook ((company-mode . company-prescient-mode)
         (company-mode . prescient-persist-mode)))


;; Popup documentation for completion candidates
(when (and (< emacs-major-version 26) (display-graphic-p))
  (use-package company-quickhelp
    :defines company-quickhelp-delay
    :bind (:map company-active-map
                ([remap company-show-doc-buffer] . company-quickhelp-manual-begin))
    :hook (global-company-mode . company-quickhelp-mode)))


(provide 'init-company)


;;; init-company.el ends here
