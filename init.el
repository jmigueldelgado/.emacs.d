;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ESS mode configuration (only if ess is in a nonstandard place)
(add-to-list 'load-path "/home/delgado/local/ess/share/emacs/site-lisp/ess");;<<CHANGE
(autoload 'R-mode "ess-site.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(setq inferior-R-program-name "/home/delgado/local/R/bin/R");;<<CHANGE
;;R stuff
(setq ess-eval-visibly-p nil)
(setq ess-ask-for-ess-directory nil)
(require 'ess-eldoc)
;;compile the first target in the Makefile in the current directory using F9
(global-set-key [f9] 'compile)
(setq compilation-read-command nil)
;;show matching parentheses
(show-paren-mode 1)
