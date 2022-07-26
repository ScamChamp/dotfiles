
;;; .emacs  -*- lexical-binding: t; -*-
(setq gc-cons-threshold (* 50 1000 1000))

(setq warning-minimum-level :emergency)
  (require 'no-littering)
(setq inhibit-startup-message t)



 ; (add-hook 'window-setup-hook 'splash-screen)

(add-hook 'prog-mode-hook 'linum-mode)


; (setq initial-frame-alist (append initial-frame-alist  '((left   . 140) (top    . 1) (width  . 135) (height . 100))))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(global-hl-line-mode +1)

 (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
;; Ns stuff

;; (setq ns-use-proxy-icon nil)
;; (setq frame-title-format nil)
;; (setq ns-auto-hide-menu-bar t)
;; (set-frame-position nil 0 -24)

(exec-path-from-shell-initialize)
(setq initial-frame-alist (append initial-frame-alist  '((left   . 160) (top   . 17) (width 130))))

(setq history-length 40)

(setq modus-themes-mode-line '(borderless padded))(setq modus-themes-region '(bg-only no-extend))(setq modus-themes-italic-constructs t)

(setq modus-themes-headings
      '((t .(rainbow))))
(setq modus-themes-org-blocks 'grey-background
modus-themes-org-blocks 'gray-background
modus-themes-org-agenda ; this is an alist: read the manual or its doc string
      '((header-block . (variable-pitch 1.3))
        (header-date . (grayscale workaholic bold-today 1.1))
        (event . (accented varied))
        (scheduled . uniform)
        (habit . traffic-light))      				    				      )
 (load-theme 'modus-vivendi t)



(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))


;elisp mode
;backup file remove
(setq make-backup-files nil )
;;HOOKs






(menu-bar-mode -1)
(setq visible-bell t)

(set-face-attribute 'default nil :font "MonoLisa" :height 196)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
	     ("melpa" . "http://melpa.org/packages/")))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode 1)

;; Startup hook -------------------

(add-hook 'after-init-hook '(lambda()

					;			      (ace-jump-char-mode)
			      (when (file-attributes "/Users/pranshu/.slime-history.eld")
				(when  (> (file-attribute-size (file-attributes "/Users/pranshu/.slime-history.eld")) 100)
				  (delete-file "/Users/pranshu/.slime-history.eld" ))

 				)
			      )
	  )
 (setq-default message-log-max 20)

(let ((alist '((?! . "\\(?:!\\(?:==\\|[!=]\\)\\)")
               (?# . "\\(?:#\\(?:###?\\|_(\\|[!#(:=?[_{]\\)\\)")
               (?$ . "\\(?:\\$>\\)")
               (?& . "\\(?:&&&?\\)")
               (?* . "\\(?:\\*\\(?:\\*\\*\\|[/>]\\)\\)")
               (?+ . "\\(?:\\+\\(?:\\+\\+\\|[+>]\\)\\)")
               (?- . "\\(?:-\\(?:-[>-]\\|<<\\|>>\\|[<>|~-]\\)\\)")
               (?. . "\\(?:\\.\\(?:\\.[.<]\\|[.=?-]\\)\\)")
               (?/ . "\\(?:/\\(?:\\*\\*\\|//\\|==\\|[*/=>]\\)\\)")
               (?: . "\\(?::\\(?:::\\|\\?>\\|[:<-?]\\)\\)")
               (?\; . "\\(?:;;\\)")
               (?< . "\\(?:<\\(?:!--\\|\\$>\\|\\*>\\|\\+>\\|-[<>|]\\|/>\\|<[<=-]\\|=\\(?:=>\\|[<=>|]\\)\\||\\(?:||::=\\|[>|]\\)\\|~[>~]\\|[$*+/:<=>|~-]\\)\\)")
               (?= . "\\(?:=\\(?:!=\\|/=\\|:=\\|=[=>]\\|>>\\|[=>]\\)\\)")
               (?> . "\\(?:>\\(?:=>\\|>[=>-]\\|[]:=-]\\)\\)")
               (?? . "\\(?:\\?[.:=?]\\)")
               (?\[ . "\\(?:\\[\\(?:||]\\|[<|]\\)\\)")
               (?\ . "\\(?:\\\\/?\\)")
               (?\] . "\\(?:]#\\)")
               (?^ . "\\(?:\\^=\\)")
               (?_ . "\\(?:_\\(?:|?_\\)\\)")
               (?{ . "\\(?:{|\\)")
               (?| . "\\(?:|\\(?:->\\|=>\\||\\(?:|>\\|[=>-]\\)\\|[]=>|}-]\\)\\)")
               (?~ . "\\(?:~\\(?:~>\\|[=>@~-]\\)\\)"))))


  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; dired mode
(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-dwim-target t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(require 'diredfl)
(require 'dired-rainbow)
(diredfl-global-mode t)
(add-hook 'dired-after-readin-hook (lambda () (text-scale-increase 1)))


(dired-rainbow-define-chmod directory "#6cb2eb" "d.*") (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml")) (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata")) (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx")) (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt")) (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc")) (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac")) (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg")) (dired-rainbow-define log "#c17d11" ("log")) (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim")) (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js")) (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java")) (dired-rainbow-define executable "#8cc4ff" ("exe" "msi")) (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar")) (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp")) (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem")) (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf")) (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak")) (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules")) (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-agho --group-directories-first")
 '(haskell-process-show-debug-tips nil)
 '(package-selected-packages
   '(ace-jump-mode yaml-mode ws-butler transient-posframe slime rust-mode rainbow-mode rainbow-delimiters projectile org-bullets no-littering multiple-cursors magit js2-mode hindent haskell-mode golden-ratio go-mode expand-region exec-path-from-shell diredfl dired-rainbow all-the-icons-dired)))


;;dealing with unused buffers
(require 'midnight)
(midnight-delay-set 'midnight-delay 16200)
(setq clean-buffer-list-delay-special 14400)
(load-file "/Users/pranshu/.emacs.d/tempbuf.elc")
(require 'tempbuf)
(add-hook 'haskell-interactive-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
 (add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'after-change-major-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'text-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'org-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'fundamental-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'compilation-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'prog-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'eww-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'go-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'magit-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'lisp-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'inferior-lisp-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'ibuffer-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'help-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'process-menu-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'eshell-mode-hook 'turn-on-tempbuf-mode)



;;Org Mode
;(add-hook 'org-mode-hook (lambda ()(variable-pitch-mode 1)))
(setq org-startup-folded t)
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-agenda-files '("/Users/pranshu/Documents/agenda.org")
 org-agenda-window-setup 'other-window
 org-agenda-span 'week
org-startup-indented t)

(set-face-attribute 'variable-pitch nil :family "IBM Plex Serif" :height 210)

;(add-to-list  'default-frame-alist'(ns-transparent-titlebar . t)) (add-to-list 'default-frame-alist'(ns-appearance . dark))


;; Kill proccses without asking
(setq confirm-kill-processes nil)

(require 'expand-region)
(global-set-key (kbd "\\") 'er/expand-region)
(global-set-key (kbd "s-\\") '(lambda()
			       (interactive)
			       (insert "\\")
			       ))
(global-set-key [f5] 'dired-jump)

;;sskell mode
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)
(setq hindent-reformat-buffer-on-save t)
(add-to-list 'auto-mode-alist '("\\.hs\\.cabal\\'" . haskell-mode))
(global-set-key (kbd "C-c k") 'haskell-interactive-kill)
;; C-c C-k to clear interactive haskell

;; go mode



;;java script
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\.json\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-hook 'html-mode-hook 'auto-rename-tag-mode)

(define-key js2-mode-map (kbd "M-s-k") #'js2r-kill)

;; rust mode
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

;;lisp
(require 'slime)
(setq inferior-lisp-program (executable-find "sbcl"))
(add-hook 'lisp-mode-hook 'slime-mode)


(add-hook 'slime-repl-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'slime-repl-mode-hook  #'rainbow-delimiters-mode)

;;soliare mode

;;yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("'\\.yaml\\.erb\\\.yml\\'" . yaml-mode))

(setq use-dialog-box nil)

(setq display-buffer-base-action
      '(display-buffer-reuse-mode-window
	display-buffer-reuse-window
	display-buffer-same-window))
;; ido

(global-unset-key (kbd "C-x b"))
(global-set-key (kbd "C-x b") 'ido-switch-buffer)

(ido-mode 1) ;; C-t to toggle regexp
(ido-everywhere t)
(setq    ; M-r in iseatch to toggle regexp
      ido-enable-flex-matching t  ; use initials
      ido-buffer-disable-smart-matches nil
      ido-max-window-height 1
      ido-default-buffer-method 'selected-window
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
   )
(define-key ido-file-completion-map "\C-o" 'ido-fallback-command)

;; (vertico-mode)
;; (setq vertico-cycle t)
(add-hook 'prog-mode-hook #'electric-pair-mode)
;; (setq read-file-name-completion-ignore-case t
;;       read-buffer-completion-ignore-case t
;;       completion-ignore-case t)
;; (vertico-flat-mode)
;; (define-key vertico-map "\§" #'vertico-quick-insert)
;;  (define-key vertico-map "\C-q" #'vertico-quick-exit)

;; (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion))))
;; (define-key vertico-map "\M-]" #'vertico-directory-delete-char)
;;  (define-key vertico-map "\d" #'vertico-directory-delete-word)
;; (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)

;; (require 'vertico-posframe)
;; (vertico-posframe-mode 1)
;; (setq vertico-posframe-poshandler #'posframe-poshandler-frame-top-center)
;; (setq vertico-posframe-params
;;       '((left-fringe . 11)
;;         (right-fringe . 11)))

(load-file "/Users/pranshu/.emacs.d/modeline.elc")
(load-file "/Users/pranshu/.emacs.d/quicknote.elc")

; shift tab to seatch
;;crtl+ e for end of line
; M+e to move forward sentence, M+a for: bac:k
 ; C-v scroll up, M-v scroll down
; C+l recenter window
; C+SPC for set mark
;C+c in neo tree to change root

;;rainbow delimeters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;(load  "/Users/pranshu/.Emacs.d/brack.elc")
;; m + ! for shell command

;;golden ratio
(require 'golden-ratio)

(golden-ratio-mode 1)

;; PROJECTILE
(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/Documents/Programming"))
(blink-cursor-mode 0)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)




;;Magit
(require 'magit)

;;smooth scorlling
(global-set-key [s-up] (lambda () (interactive) (scroll-down 2)))
(global-set-key [s-down] (lambda () (interactive) (scroll-up 2)))

(setq redisplay-dont-pause t
  scroll-margin 5
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Dealing with annoying whitesplace
(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "#444444")))))
;;multiple crusors
(require 'multiple-cursors)

(global-set-key (kbd "C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-s-p") 'mc/mark-all-like-this)
(global-set-key (kbd "M-1") 'shell-command)

;;ace-jump mode(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "M-p") 'ace-jump-mode)
(define-key global-map (kbd "M-o") 'ace-jump-char-mode)
(define-key global-map (kbd "s-.") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "s-§") #'(lambda()
			       (interactive)
			       (insert "§")
			     ))
;;org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Move text around
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))


(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)


;;isearch
(setq isearch-lazy-count t)


 (defun quick-copy-line ()
      "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
      (interactive)
      (let ((beg (line-beginning-position 1))
            (end (line-beginning-position 2)))
        (if (eq last-command 'quick-copy-line)
            (kill-append (buffer-substring beg end) (< end beg))
          (kill-new (buffer-substring beg end))))
      (beginning-of-line 2))

(global-set-key (kbd "s-/") 'magit)
(global-set-key (kbd "s-;") 'quick-copy-line)

;;Magit posframe

(require 'transient-posframe)
(transient-posframe-mode)

    (global-set-key "\M- " 'hippie-expand)


;; So long mode
 (global-so-long-mode 1)


;;Open line below
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)

(indent-for-tab-command))

(global-set-key (kbd "s-<return>") 'open-line-below)


(super-save-mode +1)
(setq super-save-remote-files nil)
;; so i do not have to tyoe yes or no you know

(setq use-short-answers t)

;; (autoload 'paredit-mode "paredit"
;;       "Minor mode for pseudo-structurally editing Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
;; (add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
;; (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-mode-hook            (lambda () (paredit-mode +1)))
;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))


;;  eshell
(load-file "/Users/pranshu/.emacs.d/eshell.elc")


;; undo
 (setq undo-limit 1000000)
