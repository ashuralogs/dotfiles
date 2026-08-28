;;; -*- lexical-binding: t; -*-

(use-package vterm)

(defvar my-vterm-below-p t)
(defvar my-vterm-right-width 60)

(defun my-vterm-show (&optional switch)
  (save-window-excursion
    (vterm))

  (let ((win (get-buffer-window "*vterm*")))
    (unless win
      (setf win
	    (if my-vterm-below-p
		(split-window nil -15 'below)
	      (split-window nil (- my-vterm-right-width) 'right)))
      
      (set-window-buffer win "*vterm*"))
    
    (when switch (select-window win))))


(defun my-vterm-is-focused ()
  (let ((win (get-buffer-window "*vterm*")))
    (if (eq win (selected-window))
	win
      nil)))


(defun my-vterm-right-update-width (win)
  (unless my-vterm-below-p
    (setf my-vterm-right-width
	  (window-width win))))


(defun my-vterm-hide ()
  (let ((win (my-vterm-is-focused)))
    (when win
      ;; Remember current right-side width
      (my-vterm-right-update-width win)
      
      (delete-window win))))


(defun my-vterm-toggle ()
  (interactive)
  (if (my-vterm-is-focused)
      (my-vterm-hide)
    (my-vterm-show t)))


(global-set-key (kbd "C-`") #'my-vterm-toggle)


(defun my-vterm-move ()
  (interactive)

  (let ((win (get-buffer-window "*vterm*")))

    (when win
      (my-vterm-right-update-width win)
      (delete-window win))

    (setf my-vterm-below-p
	  (not my-vterm-below-p))

    (my-vterm-show t)))


(global-set-key (kbd "C-M-`") #'my-vterm-move)


(defun my-vterm-send (command)
  (my-vterm-show)
  (with-current-buffer "*vterm*"
    (goto-char (point-max))
    (vterm-send-string command t)
    (vterm-send-return)))


(provide 'terminal)
