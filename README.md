## dotemacs

My `.emacs` directory. Currently being used on OS X Yosemite with Emacs 24.4.1, which was installed thus:

    brew install emacs --cocoa --srgb

### Terminal setup

I run Emacs inside a terminal, so I can make liberal use of Ctrl-Z to drop back to the shell and run commands (and return to Emacs by typing `fg`).

I'm using iTerm2 with the following additional settings:

* Under Preferences/Profiles/Keys, I set both left and right option keys to act as `+Esc`, so Emacs will recognize them as Meta.

* Under Preferences/Keys, I set Right Option to `Control`, and Right Command to `Right Option`. This lets me pretend my Macbook has Alt and Ctrl keys to the right of the spacebar, like every other computer I've ever run Emacs on.
