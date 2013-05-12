This is a utility which helps you pop up and pop out shell buffer
window easily. Just do M-x shell-pop, and it is strongly recommended
to assign one hot-key to this function.

I hope this is useful for you, and ENJOY YOUR HAPPY HACKING!

Configuration:

You can choose your favorite internal mode such as `shell', `terminal',
`ansi-term', and `eshell'. Also you can use any shell such as
`/bin/bash', `/bin/tcsh', `/bin/zsh' as you like.

A configuration sample for your .emacs is as follows.

(require 'shell-pop)
The default key-bindings to run shell-pop.
(shell-pop-set-universal-key (kbd "\C-t"))
You can choose the internal mode from "shell", "terminal", "ansi-term", and "eshell".
(shell-pop-set-internal-mode "ansi-term")
You can choose your favorite shell to run.
(shell-pop-set-internal-mode-shell "/bin/zsh")
The number for the percentage for selected window.
If 100, shell-pop use the whole of selected window, not spliting.
(shell-pop-set-window-height 60)
The position for shell-pop window. You can choose "top" or "bottom".
(shell-pop-set-window-position "bottom")
The default directory when shell-pop invokes
(shell-pop-set-default-directory "/Users/kyagi/git")
