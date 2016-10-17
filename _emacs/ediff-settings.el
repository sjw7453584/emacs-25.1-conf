;; -*- Emacs-Lisp -*-

;; Time-stamp: <2013-11-25 15:10:40 Monday by media>

(global-set-key (kbd "C-x D") 'ediff)

;;;###autoload
(defun ediff-current-file ()
  "Start ediff between current buffer and its file on disk.
This command can be used instead of `revert-buffer'.  If there is
nothing to revert then this command fails."
  (interactive)
  (unless (or revert-buffer-function
              revert-buffer-insert-file-contents-function
              (and buffer-file-number
                   (or (buffer-modified-p)
                       (not (verify-visited-file-modtime
                             (current-buffer))))))
    (error "Nothing to revert"))
  (let* ((auto-save-p (and (recent-auto-save-p)
                           buffer-auto-save-file-name
                           (file-readable-p buffer-auto-save-file-name)
                           (y-or-n-p
                            "Buffer has been auto-saved recently.  Compare with auto-save file? ")))
         (file-name (if auto-save-p
                        buffer-auto-save-file-name
                      buffer-file-name))
         (revert-buf-name (concat "FILE=" file-name))
         (revert-buf (get-buffer revert-buf-name))
         (current-major major-mode))
    (unless file-name
      (error "Buffer does not seem to be associated with any file"))
    (when revert-buf
      (kill-buffer revert-buf)
      (setq revert-buf nil))
    (setq revert-buf (get-buffer-create revert-buf-name))
    (with-current-buffer revert-buf
      (insert-file-contents file-name)
      ;; Assume same modes:
      (funcall current-major))
    (ediff-buffers revert-buf (current-buffer))))


(defun ediff-settings ()
  "settings for `ediff'."
  (defun ediff-variable-settings ()
    (setq ediff-highlight-all-diffs nil
          ediff-highlighting-style 'face))

  (defun ediff-keys ()
    (interactive)
    "`ediff-mode'的按键设置"
    (define-prefix-command 'ediff-R-map)
    (define-key-list
      ediff-mode-map
      `(("# w" ediff+-toggle-ignore-whitespace)
        ("u"   ediff-update-diffs)
        ("/"   ediff-toggle-help)
        ("c"   ediff-inferior-compare-regions)
        ("f"   ediff-jump-to-difference)
        ("j"   ediff+-previous-line)
        ("k"   ediff-scroll-vertically)
        ("R"   ediff-R-map)
        ("R a" ediff-toggle-read-only)
        ("R b" ediff-toggle-read-only)
        ("o"   other-window)
        ("A"   ediff+-goto-buffer-a)
        ("B"   ediff+-goto-buffer-b))))

  (defun ediff-startup-settings ()
    "Settings of ediff startup."
    (ediff-next-difference))

  (add-hook 'ediff-startup-hook 'ediff-startup-settings)
  (add-hook 'ediff-prepare-buffer-hook 'turn-off-hideshow)
  (add-hook 'ediff-mode-hook 'ediff-variable-settings)
  (add-hook 'ediff-keymap-setup-hook 'ediff-keys)

  ;; 用ediff比较的时候在同一个frame中打开所有窗口
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  (require 'ediff+))
  ;;(ediff+-set-actual-diff-options)

(eval-after-load "ediff"
  `(ediff-settings))

(provide 'ediff-settings)
