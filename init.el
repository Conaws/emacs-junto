
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq apropos-sort-by-scores t)

(desktop-save-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" default)))
 '(default-input-method "devanagari-itrans")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(line-number-mode nil)
 '(max-specpdl-size 1335)
 '(org-agenda-files
   (quote
    ("~/orgmap/priorities.org" "~/orgmap/lessons.org" "~/orgmap/refile.org" "~/orgmap/2016/02/reminders.org" "~/orgmap/2016/02/priority.org" "~/orgmap/hindi.org" "~/orgmap/2016/02/12.org" "~/orgmap/blankq.org" "~/orgmap/edgemap.org" "~/orgmap/velocity.org" "~/orgmap/mek-notes.org" "~/orgmap/notes.org" "~/orgmap/2016/02/11.org")))
 '(org-archive-location "%s_archive::archive.org")
 '(org-capture-templates
   (quote
    (("q" "Question" entry
      (file "~/orgmap/lessons.org")
      "* %? :question:" :prepend t :clock-in t :clock-resume t)
     ("L" "Lesson" entry
      (file "~/orgmap/lessons.org")
      "* %? :lesson:" :prepend t :jump-to-captured t :clock-in t :clock-keep t)
     ("d" "distraction" entry
      (file "~/orgmap/notes.org")
      "* %? :distraction:" :empty-lines-after 1 :clock-in t :clock-resume t :unnarrowed t)
     ("t" "todo" entry
      (file "~/orgmap/refile.org")
      "* TODO %?
%U
%a
" :clock-in t :clock-resume t)
     ("r" "respond" entry
      (file "~/orgmap/refile.org")
      "* NEXT Respond to %:from on %:subject
SCHEDULED: %t
%U
%a
" :immediate-finish t :clock-in t :clock-resume t)
     ("n" "note" entry
      (file "~/orgmap/refile.org")
      "* %? :NOTE:
%U
%a
" :clock-in t :clock-resume t)
     ("j" "Journal" entry
      (file+datetree "~/orgmap/diary.org")
      "* %?
%U
" :clock-in t :clock-resume t)
     ("w" "org-protocol" entry
      (file "~/orgmap/refile.org")
      "* TODO Review %c
%U
" :immediate-finish t)
     ("m" "Meeting" entry
      (file "~/orgmap/refile.org")
      "* MEETING with %? :MEETING:
%U" :clock-in t :clock-resume t)
     ("p" "Phone call" entry
      (file "~/orgmap/refile.org")
      "* PHONE %? :PHONE:
%U" :clock-in t :clock-resume t)
     ("h" "Habit" entry
      (file "~/orgmap/refile.org")
      "* NEXT %?
%U
%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
"))))
 '(org-hide-leading-stars t)
 '(org-level-color-stars-only nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-annotate-file org-choose org-drill org-velocity)))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 8))))
 '(org-velocity-always-use-bucket t)
 '(org-velocity-bucket "~/orgmap/velocity.org")
 '(org-velocity-heading-level 5)
 '(org-velocity-search-method (quote any))
 '(org-velocity-use-completion t)
 '(projectile-global-mode t)
 '(size-indication-mode t)
 '(winner-mode t))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)


(visual-line-mode)


(require 'deft)
(setq deft-directory "~/orgmap")
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-auto-save-interval 0)
;;key to launch deft
(global-set-key (kbd "C-c d") 'deft)







(setq org-todo-keywords
      '((sequence  "QUESTION(q)" "|" "BACKGROUND(b)"  "|" "ANSWERED(a)" "ABANDONED(q)")
	(sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	(sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")))


;; (defun toggle-org-completion ()
  ;; "Toggle show-trailing-whitespace between t and nil"
  ;; (interactive)
  ;; (setq org-completion-use-ido (not org-completion-use-ido)))






;; Fuzzy Matching


(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq gc-cons-threshold 20000000)



					


;(add-hook 'org-mode-hook
;	  (lambda ()
;		 (local-set-key (kbd "C-<tab>") 'hippie-expand)))




;; syncing remote changes

(global-auto-revert-mode t)


(global-set-key "\C-cv" 'org-velocity-read)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file (expand-file-name "~/orgmap/notes.org"))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/orgmap/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/orgmap/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/orgmap/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/orgmap/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/orgmap/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/orgmap/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/orgmap/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/orgmap/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))




;;; remove empty logbooks for captures that are less than a minute

(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)




(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c C-g") 'magit-status)


(global-set-key (kbd "C-x 8 C-f") 'find-file-other-window)
(global-set-key (kbd "C-x C-f") 'find-file)


(global-set-key (kbd "C-c C-f") 'find-function-at-point)



 ;;  clj refactor


(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)	    ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)



(global-set-key (kbd "<backtab>") 'hippie-expand)



;; Hydra mode



(defhydra hydra-zoom (global-map "<f2>")
   "zoom"
   ("[" text-scale-increase "in")
   ("]" text-scale-decrease "out"))


 (defhydra hydra-par ()
 "Paredit"
 ("f" forward-char "forward-char")
 ("b" backward-char "backward char")
 ("<up>" previous-line "previous line")
 ("<down>" next-line "next line")
 ("<right>" paredit-forward "forward")
 ("<left>" paredit-backward "backward")
 ("C-<right>" paredit-forward-slurp-sexp "Forward slurp")
 ("C-<left>" paredit-forward-barf-sexp "Forward Barf")
 ("M-<right>" paredit-backward-slurp-sexp "backward slurp")
 ("M-<left>" paredit-backward-barf-sexp "backward slurp")
 ("s" paredit-splice-sexp "(foo | bar) <- (foo (bar))")
 ("w" paredit-wrap-round "(foo | bar) -> (foo (bar))"))


(global-set-key (kbd "C-]") 'hydra-par/body)

(winner-mode)

(defhydra hydra-window (:color red
                        :hint nil)
  "
 Split: _v_ert _x_:horz
Delete: _o_nly  _da_ce  _dw_indow  _db_uffer  _df_rame
  Move: _s_wap H J K L 
Frames: _f_rame new  _df_ delete
  Misc: _m_ark _a_ce  _u_ndo  _r_edo"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" hydra-move-splitter-left)
  ("J" hydra-move-splitter-down)
  ("K" hydra-move-splitter-up)
  ("L" hydra-move-splitter-right)
  ("|" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right)))
  ("_" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down)))
  ("v" split-window-right)
  ("x" split-window-below)
  ;("t" transpose-frame "'")
  ;; winner-mode must be enabled
  ("u" winner-undo)
  ("r" winner-redo) ;;Fixme, not working?
  ("o" delete-other-windows :exit t)
  ("a" ace-window :exit t)
  ("f" new-frame :exit t)
  ("s" ace-swap-window)
  ("da" ace-delete-window)
  ("dw" delete-window)
  ("db" kill-this-buffer)
  ("df" delete-frame :exit t)
  ("q" nil)
  ("i" ace-maximize-window "ace-one" :color blue)
  ("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump))

(global-set-key (kbd "M-p") 'hydra-window/body)






(defhydra hydra-global-org (:color blue)
  "Org"
  (".c" toggle-org-completion  "Customize Completion")
  ("/" org-cycle-agenda-files	"Cycle Agenda Files")
  ("t" org-timer-start "Start Timer")
  ("s" org-timer-stop "Stop Timer")
  ("r" org-timer-set-timer "Set Timer") ; This one requires you be in an orgmode doc, as it sets the timer for the header
  ("p" org-timer "Print Timer") ; output timer value to buffer
  ("w" (org-clock-in '(4)) "Clock-In") ; used with (org-clock-persistence-insinuate) (setq org-clock-persist t)
  ("o" org-clock-out "Clock-Out") ; you might also want (setq org-log-note-clock-out t)
  ("j" org-clock-goto "Clock Goto") ; global visit the clocked task
  ("c" org-capture "Capture") ; Don't forget to define the captures you want http://orgmode.org/manual/Capture.html
  ("l" org-capture-goto-last-stored "Last Capture"))

(global-set-key (kbd "C-.") 'hydra-global-org/body)






(global-set-key (kbd "C-h C-c") 'cljr-helm)


(global-set-key (kbd "C-h C-m") 'discover-my-major)
(global-set-key (kbd "C-h M-m") 'discover-my-mode)


(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))


(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel dev"))

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)


(set-register ?r '(file . "~/src/active/reagent1/project.clj"))
(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?o '(file . "~/orgmap/2016/02/"))







(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)





;;========= Hydras ===========

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))






(setq projectile-enable-caching t)



(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

(global-set-key (kbd "C-c C-p") 'hydra-projectile/body)






(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))


(global-set-key (kbd "C-;") 'toggle-comment-on-line)



;; company-mode
(require 'company)
(require 'company-etags)
(add-to-list 'company-etags-modes 'clojure-mode)
(add-hook 'after-init-hook 'global-company-mode)





(global-set-key (kbd "C-c C-;") 'avy-goto-char-2)

;; yay rainbows!
(rainbow-delimiters-mode)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
