;; -*- lexical-binding: t; -*-

(provide 'core)

;; ================================================================================
;; CORE
;; ================================================================================

;; PACKAGE SYSTEM INITIALIZATION
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)  ;; auto-install packages


;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(show-paren-mode 1)
(save-place-mode 1)          ;; Remember cursor positions in files
(global-auto-revert-mode 1)  ;; if file changes on disk reload its buffer

(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)


;; LINE NUMBERS
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable Line Numbers for certain modes
(defun my-disable-line-numbers ()
  (setq-local disable-line-numbers nil)
  (display-line-numbers-mode -1))

(dolist (mode '(org-mode-hook
		vterm-mode-hook
		pdf-view-mode-hook))
  (add-hook mode #'my-disable-line-numbers))


;; BACKUP FILES
(setq auto-save-default nil)   ;; Disable auto-saving
(setq make-backup-files nil)   ;; Disable backup~ files
(setq create-lockfiles nil)     ;; Disable .#lock files


;; PERFORMANCE
;; Something Performace Wise via ChatGPT
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold (* 2 1000 1000))))


;; FONT
(set-face-attribute 'default nil :font "Iosevka" :height 120)


(use-package doom-themes)
(load-theme 'doom-1337 t)
