(defun get-buffer-name-line()
"get the current buffername:line for convinent breakpoint"
(interactive)
(setq buffer_name (file-name-nondirectory (buffer-name)))
(setq line_num (line-number-at-pos))
(kill-new 
(with-temp-buffer 
(insert-string (format "%s:%d" buffer_name line_num))
(buffer-string)
))
)
(provide 'get-buffer-name-line)
