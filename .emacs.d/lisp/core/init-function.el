;;; init-function.el --- my function --- -*-lexical-binding: t -*-


;; kill buffer
;; https://emacs-china.org/t/emacsclient-buffer/8885/9
(defun kill-all-buffer ()
  "Kill all buffer."
  (interactive)
  (dolist (current-buffer-list (buffer-list)) (kill-buffer current-buffer-list))
  (delete-other-windows))

(defun kill-other-buffer ()
  "Close all of other buffer."
  (interactive)
  (dolist (current-buffer-list (delq (current-buffer) (buffer-list))) (kill-buffer current-buffer-list)))


(provide 'init-function)


;;; init-function.el ends here
