(defun region-insert-braces (start end)
  "Insert a markup {} around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "}")
    (goto-char start) (insert "{")
    ))

(defun region-insert-brackets (start end)
  "Insert a markup {} around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "(")
    (goto-char start) (insert ")")
    ))

(defun region-insert-quotes (start end)
  "Insert a markup {} around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "\"")
    (goto-char start) (insert "\"")
    ))

(defun region-insert-single-quotes (start end)
  "Insert a markup {} around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "'")
    (goto-char start) (insert "'")
    ))

(provide 'region_insert_marks)
