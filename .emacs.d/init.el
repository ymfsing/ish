;;; init.el --- initialize all emacs configurations  -*- lexical-binding: t; -*-


;; Better GC during in init
;; copy by https://manateelazycat.github.io/emacs/2019/05/05/lazy-load.html
(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))


;; Load the customized environment
;; copy by xuchunyang https://emacs-china.org/t/topic/5507
;; should run bash when first use
;; sh -c 'printf "%s" "$PATH"' > ~/.emacs.d/.path
(condition-case err
    (let ((path (with-temp-buffer
                  (insert-file-contents-literally "~/.emacs.d/.path")
                  (buffer-string))))
      (setenv "PATH" path)
      (setq exec-path (append (parse-colon-path path) (list exec-directory))))
  (error (warn "%s" (error-message-string err))))


;; custom file when elpa
(setq custom-file (expand-file-name "lisp/core/init-custom.el" user-emacs-directory))
(load custom-file)


;; Load path
;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-start.el
;; (defun add-subdirs-to-load-path (dir)
;;   "Recursive Add directories to `load-path'."
;;   (let ((default-directory (file-name-as-directory dir)))
;;     (add-to-list 'load-path dir)
;;     (normal-top-level-add-subdirs-to-load-path)))
;;
;; (add-subdirs-to-load-path "~/.emacs.d/mylisp/")

(add-to-list 'load-path (expand-file-name "lisp/core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/app" user-emacs-directory))


;; packages settings
;; base on https://github.com/GaloisNeko/devil-emacs   https://github.com/seagle0128/.emacs.d
;; core for core utility such as UI and completions
;; lang for programming language settings
;; app for some tools and applications
;; modules for git submodule

;; benchmark-init
(require 'init-benchmark)

;; core
;; package manager,use straight
(require 'init-package)
(require 'init-base)
(require 'init-dired)
(require 'init-edit)
;; sis, require macism(brew tap laishulu/macism; brew install macism)
(require 'init-input)
(require 'init-ui)
(require 'init-highlight)
(require 'init-company)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-git)
(require 'init-evil)
(require 'init-function)

;; programming languages
;; lsp
(require 'init-lsp)
;; markdown, required multimarkdown(brew), grip(pip)
(require 'init-markdown)
;; org
(require 'init-org)
;; emacs lisp, required roswell(brew)
(require 'init-clisp)
;; scheme
(require 'init-scheme)
;; c-c++
(require 'init-cpp)
;; python
(require 'init-python)
;; lua, required jdk
(require 'init-lua)
;; web, such as html/js/css
(require 'init-web)
;; yaml
(require 'init-yaml)


;; cancel cl warning
;; https://emacs-china.org/t/package-cl-is-deprecated/10349/14
(setq byte-compile-warnings '(cl-function))


;; Show init time
(defun display-startup-echo-area-message ()
  "Display startup message."
  (message "loaded %s packages in %s"
           (length package-activated-list)
           (emacs-init-time)
   )
  )

;; GC end here
)


;;; init.el ends here
