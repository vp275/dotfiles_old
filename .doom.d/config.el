;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "alphaQ"
      user-mail-address "text@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; (setq doom-font (font-spec :family "Sarasa Term K" :size 25))
;; (setq doom-variable-pitch-font (font-spec :family "Sarasa Term K" :size 25))
(setq doom-font (font-spec :family "JetBrains Mono" :size 23 :weight 'Light))
(setq doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 23 :weight 'Light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-modeline-height '35)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



(setq org-roam-directory "~/org/org-roam")
(setq deft-directory "~/org/org-roam")

(setq org-journal-dir "~/org/journal")

(setq org-agenda-files '("~/org/gtd/"))
(setq +org-capture-todo-file "~/org/gtd/inbox.org")

(setq org-roam-db-location "~/org/org-roam/org-roam.db")


(setq doom-modeline-major-mode-icon t)

;; Emacs Transparency
(set-frame-parameter (selected-frame) 'alpha '(98 98))
(add-to-list 'default-frame-alist '(alpha 98 98))


(require 'org)
(setq org-clock-sound "~/.doom.d/ding.wav")




(setq org-ellipsis " ▾ ")
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("⁖"))

(setq org-timer-default-timer 25)




;; Keybinding Setup

(map! :leader
      (:prefix ("t". "timer")
       :desc "Start a timer"            "t" #'org-timer-set-timer
       :desc "Stop timer"               "s" #'org-timer-stop))

;; (map! :leader
;;       :desc "i3 Config"
;;       "i 3" #'find-file '~/.config/i3/config)




;; Vulpea
(use-package vulpea
  :ensure t
  ;; hook into org-roam-db-autosync-mode you wish to enable
  ;; persistence of meta values (see respective section in README to
  ;; find out what meta means)
  :hook ((org-roam-db-autosync-mode . vulpea-db-setup)))


;; Org roam ui
;; (use-package! websocket
;;     :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
