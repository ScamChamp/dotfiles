(setq lexical-binding t)

(require 'all-the-icons)
(defun custom-modeline-time ()
  (let* ((hour (string-to-number (format-time-string "%I")))
         (icon (all-the-icons-wicon (format "time-%s" hour) :height 1.3 :v-adjust 0.0)))
    (concat
     (propertize (format " %s " icon) 'face `(:height 1.0 :family ,(all-the-icons-wicon-family) :background "#00384d" :foreground "darkcyan" ) 'display '(raise -0.0)))))




(defvar cogent-line-selected-window (frame-selected-window))
(defun cogent-line-set-selected-window (&rest _args)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq cogent-line-selected-window (frame-selected-window))
    (force-mode-line-update)
	(setq poont-max (point-max))
    ))
(defun cogent-line-unset-selected-window ()
  (setq cogent-line-selected-window nil)
  (force-mode-line-update))
(add-hook 'window-configuration-change-hook #'cogent-line-set-selected-window)
(add-hook 'focus-in-hook #'cogent-line-set-selected-window)
(add-hook 'focus-out-hook #'cogent-line-unset-selected-window)
(advice-add 'handle-switch-frame :after #'cogent-line-set-selected-window)
(advice-add 'select-window :after #'cogent-line-set-selected-window)
(defun cogent-line-selected-window-active-p ()
  (eq cogent-line-selected-window (selected-window)))







(setq poont-max (point-max))
(setq poont1 "")
(setq poont2 "")
(setq poontdiv nil)
(setq test123 nil)
(setq poontwam nil)


; :background "#392a48" :foreground "#6ae4b9"

;; make two strings and combine them

(defun percatage-through()

  (setq-local poontd 0)
(setq-local poont1 "")
(setq-local poont2 "")
(setq poontdiv (/ (float (line-number-at-pos)) ( float (count-lines (point-min) poont-max) )))
(setq poontdiv (if (> poontdiv 1) 1 poontdiv) )

  (setq test123 (- width-mess iamkillingtime 20 )) ;(if (buffer-modified-p) 4 (if buffer-read-only 3 0)

;(count-lines (point-min) (point-max))
(dotimes (round (* (float test123) (if (equal poontdiv 1.0e+INF) 1 poontdiv )))

    (if (cl-evenp poontd)
	(setq poont1 (concat poont1 "_"))
	(setq poont2 (concat poont2 "_"))
       )
    (setq poontd (+ 1 poontd))

    )

  (setq poontwam t)

   (dotimes (number (- test123 poontd))
      (if poontwam
	  (setq poont1 (concat " " poont1))
	  (setq poont2 (concat poont2 " "))
	  )
      (setq poontwam (not poontwam))
      ))



   (setq iamkillingtime nil)






;;(x-display-pixel-width)


(setq  width-mess nil)

(defun simple-mode-line-render (left right)
  "Return a string of `window-width' length containing LEFT, and RIGHT
 aligned respectively."

  (let* ((available-width (- (window-width) (length left) -7)))
    (setq width-mess available-width)
    (format (format "%%s%%%ds" available-width) left right)))



(setq-default mode-line-format
      '((:eval (simple-mode-line-render
                ;; left
                (format-mode-line (list





	   ;  '(:eval  (if (cogent-line-selected-window-active-p)
;  (propertize " ♜     " 'face '(:foreground "#6ae4b9" :background "#000000") )
		;	(propertize " ♟     " 'face '(:foreground "#00bcff" :background "#000000"))))

	     '(:eval (when-let (vc vc-mode)
                         (list " "
                               (propertize (substring vc 5)
                                           'face '(:foreground "#00bcff" :background "#000000"))
                               " ")))

	   '(:eval (list
                        ;; the buffer name; the file name as a tool tip
                    (propertize " %b      " 'face '(:weight medium :foreground "#f78fe7" :background "#000000")
				
                                    'help-echo (buffer-file-name))
                        (when (buffer-modified-p)
			  (setq poont-max (point-max))
                          (propertize
                           " ✎ "
                           'face (if (cogent-line-selected-window-active-p)
                                     '(:foreground "cyan" :background "#000000")
                                   '(:foreground "darkcyan" :background "#000000"))))
                        (when buffer-read-only
                          (propertize
                           "  "
                           'face (if (cogent-line-selected-window-active-p)
                                     '(:foreground "cyan" :background "#000000")
                                   '(:foreground "darkcyan" :background "#000000")))
)





	   (propertize  "                 %p             " 'face '(:background "#392a48" :foreground "#6ae4b9"))



		    '(:eval(list(custom-modeline-time)))




				   ))))
                ;; right
           (format-mode-line (list



			      '(:eval  (if (cogent-line-selected-window-active-p)
					   (propertize (progn
							 (setq iamkillingtime
							       ( +
								 (when (stringp mode-name)
								(string-width  mode-name))
								 ( string-width (prin1-to-string (line-number-at-pos)))
								 (string-width (prin1-to-string (current-column)))


								 ))
							 (percatage-through) (format "%s%s" poont1 poont2))
						       'face '(:foreground "#fdf5e8")
						       )
					 (propertize " " 'face 'font-lock-constant-face)
	 				 )
				       )




	   (propertize  "     %l:%c     " 'face '(:background "#00384d" :foreground "darkcyan" :slant italic))
	   ;; (propertize (format "     %s     " (if (stringp mode-name)
	   ;; 					  (if (string= mode-name "Dired by name") "browse" mode-name) " " )  )
	   ;; 	       'face '(:background "#392a48" :foreground "#6ae4b9"))
	   '(:eval (if (if(stringp mode-name) (< 8 (string-width mode-name)) nil  )
		       (propertize  "%m       "    'face '(:background "#392a48" :foreground "#6ae4b9"))
		     (propertize  "   %m           "	      'face '(:background "#392a48" :foreground "#6ae4b9")
)

	       ))

))
)
)
)
)
