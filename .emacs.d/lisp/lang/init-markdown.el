;;; init-markdown.el --- Initialize markdown configurations.	-*- lexical-binding: t -*-
;; copy by https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-markdown.el


(use-package markdown-mode
  :commands markdown--command-map-prompt
  :mode (("README\\.md\\'" . gfm-mode))
  :init
  (setq markdown-enable-wiki-links t
        markdown-italic-underscore t
        markdown-asymmetric-header t
        markdown-make-gfm-checkboxes-buttons t
        markdown-gfm-uppercase-checkbox t
        markdown-fontify-code-blocks-natively t

        markdown-content-type "application/xhtml+xml"
        markdown-css-paths '("https://cdn.jsdelivr.net/gh/ymfsing/Tools/web/ymfsing.css")
        markdown-xhtml-header-content "
<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
<style>
body {
  box-sizing: border-box;
  max-width: 740px;
  width: 100%;
  margin: 40px auto;
  padding: 0 10px;
}
</style>
<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>
<script>
document.addEventListener('DOMContentLoaded', () => {
  document.body.classList.add('markdown-body');
  document.querySelectorAll('pre code').forEach((code) => {
    if (code.className != 'mermaid') {
      hljs.highlightBlock(code);
    }
  });
});
</script>
<script src='https://cdn.jsdelivr.net/gh/mermaid-js/mermaid/dist/mermaid.min.js'></script>
<script>mermaid.initialize({startOnLoad: true});</script>
<script id='MathJax-script' async src='https://cdn.jsdelivr.net/gh/mathjax/MathJax/es5/tex-mml-chtml.js'></script>
"
        markdown-gfm-additional-languages "Mermaid")

  ;; `multimarkdown' is necessary for `highlight.js' and `mermaid.js'
  (when (executable-find "multimarkdown")
    (setq markdown-command "multimarkdown"))

  ;; Use `which-key' instead
  (advice-add #'markdown--command-map-prompt :override #'ignore)
  (advice-add #'markdown--style-map-prompt   :override #'ignore)
  :config
  (add-to-list 'markdown-code-lang-modes '("mermaid" . mermaid-mode))

  ;; Preview with built-in webkit
  ;; can't preview filename is chinese
  (with-no-warnings
    (defun my-markdown-export-and-preview (fn)
      "Preview with `xwidget' if applicable, otherwise with the default browser."
      (if (featurep 'xwidget-internal)
          (progn
            (xwidget-webkit-browse-url (concat "file://" (markdown-export)))
            (let ((buf (xwidget-buffer (xwidget-webkit-current-session))))
              (when (buffer-live-p buf)
                (and (eq buf (current-buffer)) (quit-window))
                (pop-to-buffer buf))))
        (funcall fn)))
    (advice-add #'markdown-export-and-preview :around #'my-markdown-export-and-preview))


  ;; Preview via `grip'
  ;; Install: pip install grip
  (use-package grip-mode
    :bind (:map markdown-mode-command-map
           ("g" . grip-mode))
    :init
    (setq grip-update-after-change nil)
    (let ((credential (auth-source-user-and-password "api.github.com")))
      (setq grip-github-user (car credential)
            grip-github-password (cadr credential))))

  ;; Table of contents
  (use-package markdown-toc
    :bind (:map markdown-mode-command-map
           ("r" . markdown-toc-generate-or-refresh-toc))))

(provide 'init-markdown)


;;; init-markdown.el ends here
