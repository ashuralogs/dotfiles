;; -*- lexical-binding: t; -*-

(provide 'org-config)

;; ================================================================================
;; ORG CONFIG
;; ================================================================================


(require 'org)
(require 'org-tempo)


;; PACKAGES
(use-package visual-fill-column)

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :custom
  ;; Headings & Lists
  (org-modern-star '("◉" "○" "◆" "◇" "▶" "▷"))
  (org-modern-list '((?- . "•")
                     (?+ . "‣")
                     (?* . "⁃")))

  ;; Checkboxes
  (org-modern-checkbox
   '((?X . "✓")))

  ;; Tables & Blocks
  (org-modern-table-vertical 1)
  (org-modern-table-horizontal 1)
  (org-modern-block-fringe 4)
  (org-modern-block-name t)
  (org-modern-block-border t)

  ;; TODO & Tags
  (org-modern-todo t)
  (org-modern-tag t))


;; BASIC ORG SETTINGS
(setq org-hide-emphasis-markers t)
;; (setq org-startup-folded 'overview)
(setq org-confirm-babel-evaluate nil)

(setq org-src-window-setup 'current-window)
(setq org-src-preserve-indentation t)
(setq org-edit-src-content-indentation 0)

(setq org-ellipsis " ▼ ")
(setq org-indent-indentation-per-level 3)


;; VISUAL FILL / WRAPPING
(defun my/org-visual-setup ()
  (setf visual-fill-column-width 110
	visual-fill-column-center-text t)
  
  (visual-fill-column-mode 1)
  (visual-line-mode 1))

(add-hook 'org-mode-hook #'my/org-visual-setup)
(add-hook 'org-mode-hook #'org-indent-mode)


;; SOURCE BLOCK TEMPLATES
(setq org-structure-template-alist
      '(("c"        . "src c")
        ("py"       . "src python")
        ("sh"       . "src shell")
	("awk"      . "src awk")
        ("el"       . "src emacs-lisp")
	("lisp"     . "src lisp")
	("typst"    . "src typst")
	("cetz"     . "src cetz")
	("carousel" . "src carousel")))


;; ORG FACES & FILE ASSOCIATIONS
(with-eval-after-load 'org

  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5
                  org-level-6
                  org-level-7
                  org-level-8))

    (set-face-attribute face nil
                        :weight 'bold
                        :height 1.1))

  ;; Images
  (add-to-list 'org-file-apps '("\\.png\\'"  . "feh %s"))
  (add-to-list 'org-file-apps '("\\.jpg\\'"  . "feh %s"))
  (add-to-list 'org-file-apps '("\\.jpeg\\'" . "feh %s"))
  (add-to-list 'org-file-apps '("\\.gif\\'"  . "feh %s"))
  (add-to-list 'org-file-apps '("\\.webp\\'" . "feh %s"))
  (add-to-list 'org-file-apps '("\\.svg\\'"  . "feh %s"))

  ;; Video
  (add-to-list 'org-file-apps '("\\.mp4\\'" . "mpv %s")))


;; IMAGES
(setq org-image-align 'center)

