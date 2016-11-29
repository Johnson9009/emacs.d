
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

;;add whatever packages you want here
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

(load-theme 'monokai t)

;;Config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;Config for smartparens
(require 'smartparens)
(smartparens-global-mode 1)

;;Config for popwin
(require 'popwin)
(popwin-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen 1)
(global-auto-revert-mode 1)
(global-linum-mode 1)
(global-company-mode 1)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode 1)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;Auto Generated.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
