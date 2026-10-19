(add-to-list 'load-path
	     (expand-file-name "config"
		     (file-name-directory
		      (or load-file-name buffer-file-name))))

(require 'core)
(require 'org-config)

