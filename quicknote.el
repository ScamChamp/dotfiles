;;; -*- lexical-binding: t; -*-

(require 'posframe)
(require 'projectile)

(global-set-key [f8] 'quicknote)
(global-set-key [f7] 'quicknotel)
(global-set-key [f3] 'shell-tog)
(global-set-key (kbd "s-<f7>") 'openagen)

(defun openagen()
  (interactive)
   (find-file (car org-agenda-files))
  )
;; make a agenda and a temprary

;;save befere exit
;(delete-file "/home/pranshu/.esktopscratch.org")


;buffer-file-name for file name
; buffer-name
(setq path "nil")
(setq bname nil)

(global-set-key [?\C-`] 'setstuff)

(defun setstuff()
  (interactive)
    (message "File set: %S" (buffer-name))
    (setq bname (buffer-name))
    (setq path (buffer-file-name))
)
(defun quicknote()
 (interactive)
  (if (string= path "nil")
      (setstuff)
 (progn


;  (add-hook 'post-command-hook (lambda()				 )  nil t)
    (global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") (lambda()
				   (interactive)
				   (save-buffer path)
				      (next-window-any-frame)
				     (posframe-delete-all)
				      (global-unset-key (kbd "<escape>"))
				      (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
				      (global-set-key [f8] 'quicknote)
				      (global-set-key [f7] 'quicknotel)
				      ))
(global-unset-key [f8])
(global-set-key [f8] (lambda()
		       (interactive)
		       (execute-kbd-macro (kbd "<escape>"))))

(when (not(get-buffer bname))
  (find-file-noselect path)
  )


  (posframe-show

     bname
   :poshandler 'posframe-poshandler-frame-center

   :border-color "#00bcff"
   :width (round (* (frame-width) 0.75))
   :height (round (* (frame-height) 0.90))
   :border-width 2
   :override-parameters '((left-fringe . 20)
			  (right-fringe . 20)
			  (cursor-type . box)
			  (alpha . 95)
			  )
   :accept-focus t
   :font
   )

   (with-current-buffer bname
     (setq-local cursor-type t)
     (setq-local cursor-in-non-selected-windows 'box))


   ))


  )
(defun quicknotel()
  (interactive)
;  (add-hook 'post-command-hook (lambda()	     		 )  nil t)
    (global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") (lambda()
				   (interactive)
				   (save-buffer (car org-agenda-files))
				      (next-window-any-frame)
				     (posframe-delete-all)
				      (global-unset-key (kbd "<escape>"))
				      (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
				      (global-set-key [f7] 'quicknotel)

				      				      (global-set-key [f8] 'quicknote)
				      ))
(global-unset-key [f7])
(global-set-key [f7] (lambda()
		       (interactive)
		       (execute-kbd-macro (kbd "<escape>"))))

(when (not(get-buffer "scratch.org"))
  (find-file-noselect (car org-agenda-files))
  )


  (posframe-show

     "agenda.org"
   :poshandler 'posframe-poshandler-frame-center
   :border-color "#00bcff"
   :width (round (* (frame-width) 0.80))
   :height (round (* (frame-height) 0.90))
   :border-width 2
   :override-parameters '((left-fringe . 20)
			  (right-fringe . 20)
			  (cursor-type . box)
			  (alpha . 98)
			  )
   :accept-focus t

   )

   (with-current-buffer "agenda.org"
     (setq-local cursor-type t)
     (setq-local cursor-in-non-selected-windows 'box))
   (next-window-any-frame)
   )




(defun shell-toggle--get-directory ()

  (if  (projectile-project-root)
	(projectile-project-root)

    default-directory

      )
  )


(defun shell-tog()
  (interactive)


  (if(get-buffer "*eshell*")
      (if (get-buffer-window "*eshell*")
	 (delete-window (get-buffer-window "*eshell*"))	        ;;
	 (progn			        ;;
	   (split-window-below 10)	        ;;

	  (switch-to-buffer "*eshell*")        ;;
	   )


	  )
   (progn      (split-window-below)	  (other-window 1)(let ((default-directory (shell-toggle--get-directory)))(eshell) ) )
     )
;  (seq-contains "shell" (window-list ))

  )
