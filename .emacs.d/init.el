(add-to-list 'load-path "C:/emacs/.emacs.d")

(set-background-color "grey")
(scroll-bar-mode 0)
(setq visible-bell t)
(blink-cursor-mode -1)
(show-paren-mode 1)
(setq ring-bell-function 'ignore)

(require 'bar-cursor)
(bar-cursor-mode t)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(load-theme 'wombat t)

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" 
      "Major mode for editing Markdown files" t)
     (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))    
     (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
     (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
					(if autopair-handle-action-fns
						autopair-handle-action-fns
					  '(autopair-default-handle-action))
					'((lambda (action pair pos-before)
						(hl-paren-color-update)))))))

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
