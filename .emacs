(defvar my-plugins-root-dir "/home/dragons/site-lisp/")

(global-set-key (kbd "C-SPC") nil)

(add-to-list 'load-path "/home/dragons/site-lisp/wubi")

(require 'wubi)
(wubi-load-local-phrases) ; add user's Wubi phrases

(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

(setq default-input-method "chinese-wubi")


;;;(require 'jde)
;;;
;;;(if defer-loading-jde
;;;    (progn
;;;      (autoload 'jde-mode "jde" "JDE mode." t)
;;;      (setq auto-mode-alist
;;;	    (append
;;;	     '(("\\.java\\'" . jde-mode))
;;;	     auto-mode-alist)))
;;;  (require 'jde))



(add-to-list 'load-path' "~/.emacs.d/site-lisp")
;;;(add-to-list 'load-path' "~/.emacs.d/site-lisp/cedet/common")
(add-to-list 'load-path' "~/site-lisp/cedet1.0/common")
(load-file "~/site-lisp/cedet1.0/common/cedet.el")
(require 'cedet)

;;;(require 'semantic-ia)
(global-ede-mode 1)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)
;;;(semantic-load-enable-guady-code-helpers)
;;;(semantic-load-enable-excessive-code-helpers)
;;;(semantic-load-enable-semantic-debugging-helpers)
;;;(global-srecode-minor-mode 1)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)

;;;(load-file "/home/dragons/Downloads/cedet-1.0/common/cedet.el")
;;;(require 'cedet)
;;;(global-ede-mode 1)
;;;(semantic-load-enable-code-helpers)
;;;(global-srecode-minor-mode 1)

(add-to-list 'load-path "/home/dragons/site-lisp/color-theme")
(load-file "/home/dragons/site-lisp/color-theme/color-theme.el")
(load-file "/home/dragons/site-lisp/color-theme/color-theme-sunburst.el")
(require 'color-theme)
(color-theme-initialize)
(color-theme-tm)
;;;(color-theme-robin-hood)

;;; 显示行号
(load-file "~/site-lisp/line-num.el")
(load-file "~/site-lisp/linum+.el")
(require 'linum)
(global-linum-mode 1)

(setq default-tab-width 4)

;;;(load-file "~/site-lisp/highlight-current-line.el")
;;;(require 'hl-line)
;;;(global-hl-line-mode 1)

(add-to-list 'load-path "/home/dragons/site-lisp")
(require 'php-mode)

(load-file "/home/dragons/site-lisp/xcscope.el")
(require 'xcscope)

(add-to-list 'load-path "/home/dragons/site-lisp/ecb")
(load-file "/home/dragons/site-lisp/ecb/ecb.el")
(require 'ecb)
(setq ecb-auto-activate t 
      ecb-tip-of-the-day nil)
(setq ecb-layout-name "left14")

(add-to-list 'load-path "/home/dragons/site-lisp/jdee")
(add-to-list 'load-path "/home/dragons/site-lisp/jdee/lisp")
(add-to-list 'load-path "/home/dragons/site-lisp/elib")
(require 'jde)

(defvar start-dir (getenv "PWD"))
(defvar start-dir-name (car (last (split-string start-dir "/"))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left14" (0.19879518072289157 . 0.717948717948718) (0.19879518072289157 . 0.2564102564102564)) )))
 '(ecb-options-version "2.40")
 '(ecb-source-path (list (list start-dir start-dir-name)))
 '(jde-jdk (quote ("1.6")))
 '(jde-jdk-registry (quote (("1.6" . "/usr/local/jdk17")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(global-set-key [f12] 'ecb-activate) ;; F12激活ecb
(global-set-key [C-f12] 'ecb-deactivate)

(add-to-list 'load-path "/home/dragons/site-lisp/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/home/dragons/site-lisp/yasnippet/snippets")
(yas/global-mode 1)

(require 'flymake)
(defvar php_main "/usr/local/php/bin/php")
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list php_main (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))
(push '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2) 
      flymake-err-line-patterns)


(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)


;;把代码复制到.emacs里面，然后重新启动emacs
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(defvar compile-guess-command-table
  '((c-mode       . "gcc -Wall -g %s -o %s -lm"); Doesn't work for ".h" files.
    (c++-mode     . "g++ -g %s -o %s -lm")	; Doesn't work for ".h" files.
    (fortran-mode . "f77 -C %s -o %s")
    (cperl-mode    . "p1 %s")
    (csharp-mode  . "csc  %s")
    (php-mode  . "/usr/local/php/bin/php -l %s")
    )
  "*Association list of major modes to compilation command descriptions, used
by the function `compile-guess-command'.  For each major mode, the compilation
command may be described by either:

  + A string, which is used as a format string.  The format string must accept
    two arguments: the simple (non-directory) name of the file to be compiled,
    and the name of the program to be produced.

  + A function.  In this case, the function is called with the two arguments
    described above and must return the compilation command.")


;; This code guesses the right compilation command when Emacs is asked
;; to compile the contents of a buffer.  It bases this guess upon the
;; filename extension of the file in the buffer.

(defun compile-guess-command ()

  (let ((command-for-mode (cdr (assq major-mode
				     compile-guess-command-table))))
    (if (and command-for-mode
	     (stringp buffer-file-name))
	(let* ((file-name (file-name-nondirectory buffer-file-name))
	       (file-name-sans-suffix (if (and (string-match "\\.[^.]*\\'"
							     file-name)
					       (> (match-beginning 0) 0))
					  (substring file-name
						     0 (match-beginning 0))
					nil)))
	  (if file-name-sans-suffix
	      (progn
		(make-local-variable 'compile-command)
		(setq compile-command
		      (if (stringp command-for-mode)
			  ;; Optimize the common case.
			  (format command-for-mode
				  file-name file-name-sans-suffix)
			(funcall command-for-mode
				 file-name file-name-sans-suffix)))
		compile-command)
	    nil))
      nil)))


;; Add the appropriate mode hooks.

(add-hook 'c-mode-hook       (function compile-guess-command))
(add-hook 'c++-mode-hook     (function compile-guess-command))
(add-hook 'fortran-mode-hook (function compile-guess-command))
(add-hook 'perl-mode-hook    (function compile-guess-command))
(add-hook 'csharp-mode-hook  (function compile-guess-command))
(add-hook 'php-mode-hook  (function compile-guess-command))

;;;(require 'complie)
(require 'compile)
(push '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2) compilation-error-regexp-alist)

(add-to-list 'load-path "/home/dragons/site-lisp/slime/")
(add-to-list 'load-path "/home/dragons/site-lisp/slime/contrib/")
;;(setq inferior-lisp-program "/usr/local/commonlisp/clisp/bin/clisp")
(setq inferior-lisp-program "/usr/local/commonlisp/sbcl/bin/sbcl")
;;(load "/home/dragons/site-lisp/slime/swank-loader.lisp")
;;(require 'slime)
(require 'slime)
(slime-setup '(slime-fancy slime-asdf))
;;(slime-setup )

;;自动补全
(load "python-mode.el")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t) ;; 语法加亮
(setq font-lock-maximum-decoration t)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'pycomplete)

(require 'hl-line)
(global-hl-line-mode 1)

(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
:background "DodgerBlue3"
;;:bold
;;:weight nil
:inverse-video nil
))))
(defun wcy-color-theme-adjust-hl-mode-face()
"interactive"
(let* ((color (x-color-values (face-attribute 'default :background))))
(if (null color)
(error "not support.")
(let ((my-color (mapcar
(lambda (x)
(let ((y (/ #XFFFF 4))
(delta #X18FF))
(cond
((< x (* y 1))
(+ x delta))
((< x (* y 2))
(+ x delta))
((< x (* y 3))
(- x delta))
(t
(- x delta)))))
color)))
(message "%S %S" color my-color)
(set-face-attribute
'my-hl-line-face nil
:background
(concat "#"
(mapconcat
(lambda (c) (format "%04X" c))
my-color
"")))))))
(wcy-color-theme-adjust-hl-mode-face)

(add-to-list 'load-path "/home/dragons/site-lisp/auto-complete/")
(add-to-list 'load-path "/home/dragons/site-lisp/auto-complete/")
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(add-to-list 'load-path "~/myfile/project/git_project/weibo.emacs")
(require 'weibo)

(load-file (concat my-plugins-root-dir "common/skeleton-conf.el"))