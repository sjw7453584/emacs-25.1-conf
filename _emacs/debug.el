(defun debug-binary (binary-name)
  "start gdb for binary-name"
  (let ((gdb-buffer-name (concat "*gud-" (file-name-base binary-name) "*"))
		(pid (shell-command-to-string (concat "ps -ax |grep " (file-name-base binary-name) "|grep -v grep |grep -v gdb |awk '{print $1}'"))))
	(if (not (get-buffer gdb-buffer-name))
		(gdb (concat "gdb --annotate=1 " binary-name))
	  )
	(comint-send-string (get-buffer-process gdb-buffer-name) (concat "attach " pid))
	(switch-to-buffer gdb-buffer-name)
	)
  )

(defun debug-social ()
  "start a gdb debug session for social server"
  (interactive)
  (debug-binary "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-socialserver")
  )

(defun debug-battle ()
  "start a gdb debug session for battle server"
  (interactive)
  (debug-binary "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-battleserver")
  )

(defun debug-world ()
  "start a gdb debug session for world server"
  (interactive)
  (debug-binary "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-worldserver")
  )

(defun set-break-point (binary-name)
  "start gdb for binary-name"
  (let ((gdb-buffer-name (concat "*gud-" (file-name-base binary-name) "*"))
		(pid (shell-command-to-string (concat "ps -ax |grep " (file-name-base binary-name) "|grep -v grep |grep -v gdb |awk '{print $1}'"))))
	(if (get-buffer gdb-buffer-name)
		(progn
		  (comint-send-string (get-buffer-process gdb-buffer-name) "\C-c \C-c")
		  
		  (comint-send-string (get-buffer-process gdb-buffer-name) (concat "b " (get-buffer-name-line) "\n c\n"))
		  )
	)
	)
  )

(defun social-set-break-point ()
  "set break point at current line for socail server gdb session"
  (interactive)
  (set-break-point "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-socialserver")
  )

(defun battle-set-break-point ()
  "set break point at current line for socail server gdb session"
  (interactive)
  (set-break-point "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-battleserver")
  )

(defun world-set-break-point ()
  "set break point at current line for socail server gdb session"
  (interactive)
  (set-break-point "/home/sunjiwen/TSSG_CODE/trunk/source/server2/bin/sgzj-worldserver")
  )
