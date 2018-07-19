;=======================================================================
; .emacs: The Emacs initialization file.
; Emacs executes this file whenever it is launched.
;=======================================================================


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-face-foreground 'font-lock-comment-face "#928374" )

; Create (or don't create) backup files.
(setq-default make-backup-files t)
; (setq-default make-backup-files nil)

;-----------------------------------------------------------------------

; Set the indentation style for C code.
(setq c-default-style "ellemtel")
; (setq c-default-style "cc-mode")
; (setq c-default-style "gnu")
; (setq c-default-style "k&r")
; (setq c-default-style "bsd")
; (setq c-default-style "stroustrup")

;-----------------------------------------------------------------------

; Display (or don't display) trailing whitespace characters using an
; unusual background color so they are visible.
(setq-default show-trailing-whitespace t)
; (setq-default show-trailing-whitespace nil)

;-----------------------------------------------------------------------

; Set the "Control-x w" key sequence to call the function
; "delete-trailing-whitespace".
(global-set-key "\C-xw" 'delete-trailing-whitespace)

;-----------------------------------------------------------------------

; Turn on (or off) syntax highlighting.
(global-font-lock-mode t)
; (global-font-lock-mode nil)

;-----------------------------------------------------------------------

; Display (or don't display) the column number in the status bar.
(setq column-number-mode t)
; (setq column-number-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) the region bounded by the mark and
; the point.
(setq transient-mark-mode t)
; (setq transient-mark-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) matching parentheses, braces, and
; brackets.
(show-paren-mode t)
; (show-paren-mode nil)

;-----------------------------------------------------------------------

; Bind the "Control-x l" (the letter "ell") key sequence to
; the function "goto-line".
(global-set-key "\C-xl" 'goto-line)

;-----------------------------------------------------------------------

; Bind the Home and End keys for PuTTY.
(global-set-key "\C-[[1~" 'beginning-of-line)
(global-set-key "\C-[[4~" 'end-of-line)

; Bind the Home and End keys for the Linux GNOME Terminal.
(global-set-key "\C-[OH" 'beginning-of-line)
(global-set-key "\C-[OF" 'end-of-line)

;-----------------------------------------------------------------------

; Set the comment character for asm-mode to '#'.
(setq asm-comment-char ?#)

;-----------------------------------------------------------------------

; Indent using spaces instead of tabs, but not in makekfile-mode.
(setq indent-tab-mode nil)
(defun myIndentUsingTabs() (setq indent-tab-mode t))
(add-hook 'makefile-mode-hook 'myIndentUsingTabs)

; Indent using spaces instead of tabs, but not in makefile-mode.
; (defun myIndentUsingSpaces () (setq indent-tabs-mode nil))
; (add-hook 'text-mode-hook 'myIndentUsingSpaces)
; (add-hook 'c-mode-hook 'myIndentUsingSpaces)
; (add-hook 'asm-mode-hook 'myIndentUsingSpaces)
; (add-hook 'java-mode-hook 'myIndentUsingSpaces)
; (add-hook 'python-mode-hook 'myIndentUsingSpaces)
; (add-hook 'emacs-lisp-mode-hook 'myIndentUsingSpaces)

;-----------------------------------------------------------------------

; Indent with 2 tabs
(setq tab-width 2)

;-----------------------------------------------------------------------

; When using an X-Window System server, make the scroll bar appear
; on the right (or left).
; (set-scroll-bar-mode `right)
; (set-scroll-bar-mode `left)

;-----------------------------------------------------------------------

; Make the Control-n and Control-p keys (and the down arrow and up
; arrow keys) scroll the current window one line at a time instead
; of one-half screen at a time.
(setq scroll-step 1)

;-----------------------------------------------------------------------

; Bind the "Control-x p" key sequence to the function "indent-all".
; The "indent-all" function indents all lines of the C program in the
; current buffer according to the selected indentation style.
(defun indent-all()
   (interactive)
   (save-excursion
      (let ()
         (goto-char (point-min))
         (while (< (point) (point-max))
            (c-indent-command)
            (next-line 1))))
   (delete-trailing-whitespace))
(global-set-key "\C-xp" 'indent-all)

;-----------------------------------------------------------------------

; Tell Emacs where to find plug-in (.el) files.
(setq load-path (cons "~/.lib" load-path))

;-----------------------------------------------------------------------

; Bind the "Control-x n" key sequence to call the function "linum-mode",
; thus toggling line numbering.
(require 'linum)
(global-set-key "\C-xn" 'linum-mode)
; (defun mySetLinumMode () (interactive) (linum-mode 1))
; (add-hook 'text-mode-hook 'mySetLinumMode)
; (add-hook 'c-mode-hook 'mySetLinumMode)
; (add-hook 'asm-mode-hook 'mySetLinumMode)
; (add-hook 'java-mode-hook 'mySetLinumMode)
; (add-hook 'python-mode-hook 'mySetLinumMode)
; (add-hook 'emacs-lisp-mode-hook 'mySetLinumMode)
; (add-hook 'makefile-mode-hook 'mySetLinumMode)

;-----------------------------------------------------------------------

; Display characters in columns 72 and 73 using unusual background
; colors, thus making it easy to spot lines that are longer than 72
; characters.
 (require 'column-marker)
 (defun myMarkCol ()
    (interactive)
    (column-marker-1 73)
    (column-marker-2 72))
 (add-hook 'font-lock-mode-hook 'myMarkCol)

;-----------------------------------------------------------------------

; bind the "C-c C-f" sequence to pdflatex (instead of latex)
(setq latex-run-command "pdflatex")

;----------------------------------------------------------------------

; word wrap on word boundaries
; (global-visual-line-mode t)

;---------------------------------------------------------------------
; disable the menubar
(menu-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;---------------------------------------------------------------------
; force hosts file to open in conf mode
(add-to-list 'auto-mode-alist' ("hosts" . conf-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf314d395510f0b05aaaf7ae903ff4a19c7483b7ebdf6075be46bf44190452f5" "21942ced4867835ccf5533992afa34eee4a54014291bc36b6af7a81a7b45b7bf" "b5278f7869ca537473490fd13d2fe3efdf853d9c924c9db7bb83856b28cc154a" "1dde5de73a8fdb69342f02bd6a48a7b9603faa01f34b6adfa1d463fd8fefafbc" "acbbada7d94a88d65ea7d73b5442f2687741ca580c2513828e1ef6876120fc6a" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
