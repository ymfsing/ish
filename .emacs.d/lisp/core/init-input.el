;;; init-input.el --- Initialize input configurations.	-*- lexical-binding: t -*-


;; To-Do
;; reduce the way, sis can do it well


;; https://emacs-china.org/t/capslang-evil/467
;; https://emacs-china.org/t/topic/2997

;; (defun switch-to-zh ()
;;   "switch input method to zh"
;;   ;; (interactive)
;;   (shell-command "macism com.apple.inputmethod.SCIM.ITABC"))
;;
;;
(defun switch-to-en ()
  "switch input method to en"
  ;; (interactive)
  (shell-command "macism com.apple.keylayout.ABC"))
;;
;;
(add-hook 'evil-insert-state-exit-hook 'switch-to-en)
;; (add-hook 'evil-insert-state-entry-hook 'switch-to-zh)


(use-package sis
  :demand t
  :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  (((text-mode prog-mode markdown-mode) . sis-follow-context-mode)
  ((text-mode prog-mode markdown-mode) . sis-inline-mode))

  :config
  (sis-ism-lazyman-config
   ;; "com.apple.keylayout.ABC"
   "com.apple.keylayout.US"
   ;; "im.rime.inputmethod.Squirrel.Rime"
   "com.apple.inputmethod.SCIM.ITABC")

  (setq sis-do-set
     (lambda(source) (start-process "set-input-source" nil "macism" source "50000")))

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )


(provide 'init-input)


;;; init-input.el ends here
