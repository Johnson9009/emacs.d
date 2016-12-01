(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

;;Add whatever packages you want here
(defvar johnson/packages '(
			   company
			   monokai-theme
			   swiper
			   counsel
			   smartparens
			   popwin
			   
			   ) "Default packages")

(defun johnson/packages-installed-p ()
  (loop for pkg in johnson/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (johnson/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg johnson/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;Config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;Config for smartparens
(smartparens-global-mode 1)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;;Config for popwin
(require 'popwin)
(popwin-mode 1)

(load-theme 'monokai t)

(global-company-mode 1)

(provide 'init-packages)
