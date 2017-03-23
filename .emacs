
;;emacs参数
;; -nw 不使用图形界面 -no-window
;; -q  不加载配置文件
;; --debug-init

;;;; 添加Emacs搜索路径
(add-to-list 'load-path "~/_emacs")
(add-to-list 'load-path "~/install/ecb-2.40")
(add-to-list 'load-path "~/_emacs/codepilot")
(add-to-list 'load-path "~/_emacs/emacs-eclim")
(add-to-list 'load-path "~/_emacs/icicles")
(add-to-list 'load-path "~/_emacs/gnuserv")
;; (add-to-list 'load-path "~/.emacs.d")

;; (prefer-coding-system 'chinese-gb18030-dos)
;; (load "cedet-settings.el")
;; (setq stack-trace-on-error t)
;;(load "cedet1.1-settings.el")		

;;模板功能
(add-to-list 'load-path "~/install/yasnippet-0.6.1c")
;;自动补全
(add-to-list 'load-path "~/install/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/install/auto-complete/dict")
(ac-config-default)

;;;;读取脚本
(load "base.el")
(load "cyexpand.el")
(load "cykbd.el")
(load "addon.el")

;; ;;为了编程的配置
(load "cycode.el")

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-ede-mode t)
(semantic-mode t)
;; (load "projects.el")
(desktop-save-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(ecb-options-version "2.32")
 '(ede-project-directories
   (quote
	("/home/sunjiwen/ede_test" "/home/sunjiwen/edeproject/include" "/home/sunjiwen/edeproject/src" "/home/sunjiwen/edeproject")))
 '(global-semantic-tag-folding-mode t nil (semantic/util-modes))
 '(mouse-1-click-in-non-selected-windows t)
 '(mouse-drag-copy-region t)
 '(mouse-yank-at-point t)
 '(save-place t nil (saveplace))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(show-paren-mode t)
 '(transient-mark-mode t))


(require 'ggtags)
(require 'sdcv)

(ansi-color-for-comint-mode-on)

;; (set-default-font "-b&h-lucidatypewriter-medium-r-normal-sans-*-120-*-*-*-*-iso8859-1")
;; (set-fontset-font "fontset-default" 'han (font-spec :family="WenQuanYi Micro Hei" :size 8))

;; (create-fontset-from-fontset-spec (concat "-unknown-DejaVu Sans Mono-*-*-*-*-18-*-*-*-*-*-" "fontset-my" ",ascii:" "-misc-fixed-medi-um-r-normal--*-*-*-*-*-100-koi8-r"))

;; (set-default-font "-unknown-DejaVu Sans Mono-*-*-*-*-18-*-*-*-*-*-fontset-my") ;

;; (set-fontset-font (frame-parameter nil 'font)
;;                       'han
;;                       (font-spec :family="WenQuanYi Zen Hei"
;;                                  :size 18
;; 								 :weight="bold"))

(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)


(require 'cmake-mode)
(setq auto-mode-alist
(append '(("CMakeLists\\.txt\\'" . cmake-mode)
("\\.cmake\\'" . cmake-mode))
auto-mode-alist))

(load "graphviz-dot-mode.el") 

(setq graphviz-dot-mode-syntax-table (syntax-table)) 
;; (require 'unicad)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-info ((((type tty)) :bold t :foreground "green") (t :foreground "green")))
 '(compilation-warning ((((class color)) :foreground "red" :bold nil)))
 '(completions-first-difference ((((class color) (background dark)) (:foreground "red"))))
 '(diff-added ((((type tty pc)) :foreground "yellow") (t :foreground "aquamarine")))
 '(diff-changed ((((type tty pc)) :foreground "red" :background "blue") (t :foreground "deep pink")))
 '(diff-context ((((class grayscale) (background light)) (:foreground "LightGray" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid")) (((class color) (min-colors 88) (background dark)) (:foreground "cornflower blue")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue")) (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(diff-file-header ((((class color)) :foreground "magenta")))
 '(diff-header ((((class color)) :foreground "green")))
 '(diff-hunk-header ((((type tty pc)) :bold t :foreground "green") (t :foreground "OliveDrab1")))
 '(diff-index ((((class color)) :foreground "cyan")))
 '(diff-indicator-added ((((type tty pc)) :foreground "red" :background "white") (t :foreground "red" :background "white")))
 '(diff-indicator-removed ((((type tty pc)) :foreground "yellow" :background "red") (t :foreground "yellow" :background "red")))
 '(diff-refine-changed ((((type tty pc)) :foreground "white" :background "blue") (t :foreground "dark orchid")))
 '(diff-removed ((((class color)) :foreground "red")))
 '(ediff-current-diff-A ((((type tty)) :background "yellow" :foreground "blue") (t :background "DarkSeaGreen3" :foreground "blue violet")))
 '(ediff-current-diff-B ((((type tty)) :background "yellow" :foreground "black") (t :background "DodgerBlue1" :foreground "gray11")))
 '(ediff-fine-diff-A ((((type tty)) :background "blue" :foreground "white") (t :background "gold1" :foreground "red")))
 '(ediff-fine-diff-B ((((type tty)) :background "cyan" :foreground "red") (t :background "chocolate2" :foreground "dark slate blue")))
 '(eldoc-highlight-function-argument ((((type tty)) :bold t :foreground "green") (t :bold nil :foreground "green")))
 '(font-lock-comment-delimiter-face ((((type tty)) :bold t :foreground "red") (t :foreground "chocolate1")))
 '(font-lock-constant-face ((((type tty)) :bold t :background "white" :foreground "blue") (t :background "darkslateblue" :foreground "chartreuse")))
 '(font-lock-doc-face ((((type tty)) :foreground "green") (t (:foreground "maroon1"))))
 '(font-lock-function-name-face ((((type tty)) :bold t :background "yellow" :foreground "blue") (t :background "#45D463DD4FF8" :foreground "yellow")))
 '(font-lock-regexp-grouping-backslash ((((type tty)) :foreground "red") (t (:foreground "red"))))
 '(font-lock-regexp-grouping-construct ((((type tty)) :foreground "yellow") (t (:foreground "yellow"))))
 '(font-lock-type-face ((((type tty)) :bold t :foreground "green") (t (:foreground "green"))))
 '(font-lock-warning-face ((t (:background "red" :foreground "white"))))
 '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
 '(highlight-symbol-face ((((type tty)) :background "white" :foreground "black") (((class color) (background dark)) :background "gray30" :foreground "#AD0DE2FAFFFF") (((class color) (background light)) :background "gray90")))
 '(ido-first-match ((((type tty pc)) :foreground "yellow") (t :bold nil :foreground "yellow")))
 '(ido-only-match ((((class color)) (:bold nil :foreground "green"))))
 '(info-header-node ((((class color) (background dark)) (:foreground "red"))))
 '(info-menu-header ((((type tty pc)) :underline t :weight bold) (t :inherit nil :foreground "coral2" :bold nil)))
 '(info-quoted-name ((((type tty)) :bold t :foreground "green") (t :foreground "cornflower blue")))
 '(info-reference-item ((((type tty pc)) :background "white" :foreground "black") (t :background "white" :foreground "cornflower blue")))
 '(info-title-1 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "yellow")))
 '(info-title-2 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "lightblue")))
 '(info-title-3 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "violetred1")))
 '(info-title-4 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "green")))
 '(info-xref ((((type tty)) :inherit link) (t :foreground "#165ACBD1FFFF" :underline t)))
 '(isearch-fail ((((class color)) (:background "red"))))
 '(linum ((((background dark)) :foreground "cyan") (t :foreground "gray")))
 '(match ((((class color) (min-colors 88) (background light)) :background "yellow1") (((class color) (min-colors 88) (background dark)) :background "RoyalBlue3" :foreground "cyan") (((class color) (min-colors 8) (background light)) :background "yellow" :foreground "black") (((class color) (min-colors 8) (background dark)) :background "blue" :foreground "white") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(moccur-face ((((type tty)) :bold t :foreground "red") (t :bold nil :foreground "red")))
 '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold))))
 '(pulse-highlight-start-face ((((class color) (min-colors 88) (background dark)) :background "#AAAA33") (((class color) (min-colors 88) (background light)) :background "#FFFFAA") (((class color) (min-colors 8)) :background "blue" :foreground "red")))
 '(region ((((class color) (min-colors 88) (background dark)) :background "#4CAA4CAA4CAA") (((class color) (min-colors 88) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 16) (background dark)) :background "wheat") (((class color) (min-colors 16) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 8)) :background "blue" :foreground "red") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(semantic-highlight-func-current-tag-face ((((type tty)) nil) (((class color) (background dark)) (:background "gray20")) (((class color) (background light)) (:background "gray90"))))
 '(sh-heredoc ((((min-colors 88) (class color) (background dark)) (:foreground "deeppink")) (((class color) (background dark)) (:foreground "deeppink")) (((class color) (background light)) (:foreground "tan1")) (t (:weight bold))))
 '(zjl-elisp-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(zjl-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold)))))

(require 'get-buffer-name-line)
(require 'region_insert_marks)
(require 'semantic/ia)
(global-linum-mode)
;; (require 'battle_debug)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;; (require 'browse-kill-ring)
;; (global-set-key [(control c)(k)] 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)
;; (global-set-key [(control ?\.)] 'ska-point-to-register)
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register. 
;; Use ska-jump-to-register to jump back to the stored 
;; position."
;;   (interactive)
;;   (setq zmacs-region-stays t)
;;   (point-to-register 8))

;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;; that was stored with ska-point-to-register."
;;   (interactive)
;;   (setq zmacs-region-stays t)
;;   (let ((tmp (point-marker)))
;; 	(jump-to-register 8)
;; 	(set-register 8 tmp)))
;; (setq default-buffer-file-coding-system 'gb18030-unix)
;; (prefer-coding-system 'gb18030-unix) 
;; (set-terminal-coding-system 'gb18030-unix)
;; (set-clipboard-coding-system 'gb18030-unix)
;; (set-keyboard-coding-system 'gb18030-unix)
(setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib:" (getenv "LD_LIBRARY_PATH")))

(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(require 'eassist)

(defun c-mode-cedet-hook ()
(local-set-key "\C-ce" 'eassist-list-methods)
)
(add-hook 'c-mode-common-hook 'c-mode-cedet-hook)
(require 'psvn)
