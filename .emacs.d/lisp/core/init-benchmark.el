;;; init-benchmark.el --- benchmark init configuration  -*- lexical-binding: t; -*-


;; https://github.com/dholm/benchmark-init-el
(add-to-list 'load-path "~/.emacs.d/lisp/modules/benchmark-init-el/")
(require 'benchmark-init-loaddefs)
(benchmark-init/activate)
(add-hook 'after-init-hook 'benchmark-init/deactivate)


(provide 'init-benchmark)


;;; init-benchmark.el ends here
