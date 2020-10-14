;;; init-cpp.el --- initialize c-c++ mode settings -*- lexical-binding: t; -*-
;; https://github.com/MaskRay/ccls/wiki/lsp-mode   https://github.com/condy0919/.emacs.d/blob/master/lisp/lang/init-cpp.el

(use-package cc-mode
  :ensure nil
  :bind (:map c-mode-base-map
         ("C-c c" . compile))
  :hook (c-mode-common . (lambda () (c-set-style "bsd")
                           (setq c-basic-offset 4
                                 tab-width 4)))
  :config
  (with-eval-after-load 'lsp-mode
    (use-package ccls
      :init
      (setq ccls-executable "/usr/local/bin/ccls"))
    )

  (use-package modern-cpp-font-lock
    :diminish
    :init (modern-c++-font-lock-global-mode t))

  (use-package disaster
    :commands (disaster))

  (use-package cmake-mode
    :mode (("CMakeLists\\.txt\\'" . cmake-mode) ("\\.cmake\\'" . cmake-mode)))

  (use-package company-c-headers :defer t)

  ;; Superb compiler explorer implementation
  (use-package rmsbolt
    :ensure t
    :commands rmsbolt-compile
    :defer 1
    :custom
    (rmsbolt-asm-format nil)
    (rmsbolt-default-directory "/tmp"))

  ;; Parser generator
  (use-package bison-mode
    :ensure t
    :mode (("\\.l\\'" . flex-mode)
           ("\\.y\\'" . bison-mode)))

  :custom
  (c-comment-prefix-regexp '((c-mode   . "//+!?\\|\\**")
                             (c++-mode . "//+!?\\|\\**")
                             (awk-mode . "#+")
                             (other    . "//+\\|\\**")))
  (c-doc-comment-style `((c-mode   . gtkdoc)
                         ,(if (>= emacs-major-version 28)
                              '(c++-mode . doxygen)
                            '(c++-mode . gtkdoc))))
  (c-offsets-alist '((inline-open           . 0)
                     (brace-list-open       . 0)
                     (inextern-lang         . 0)
                     (statement-case-open   . 4)
                     (statement-cont        . (c-lineup-ternary-bodies +))
                     (access-label          . -)
                     (case-label            . 0)
                     (member-init-intro     . +)
                     (topmost-intro         . 0)
                     (inlambda              . 0) ;; better indentation for lambda
                     (innamespace           . -) ;; no indentation after namespace
                     (arglist-cont-nonempty . +))))


(provide 'init-cpp)


;;; init-cpp.el ends here
