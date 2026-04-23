# Essential Vim Cheat Sheet

### 🟢 Navigation (Moving Around)
| Command | Action |
| :--- | :--- |
| `h` `j` `k` `l` | Move **Left**, **Down**, **Up**, and **Right** |
| `0` | Jump to the very beginning of the line |
| `^` | Jump to the first non-blank character of the line |
| `$` | Jump to the end of the line |
| `w` | Move forward to the start of the next word (punctuation is a word) |
| `W` | Move forward to the start of the next word (only spaces separate words) |
| `b` | Move backward to the start of a word |
| `B` | Move backward to the start of a word (only spaces separate words) |
| `e` | Move forward to the end of a word |
| `gg` | Jump to the first line of the file |
| `G` | Jump to the last line of the file |
| `[LineNumber]G`| Jump to a specific line number (e.g., `42G`) |
| `%` | Jump to the matching bracket `()`, `[]`, or `{}` |
| `Ctrl + f` | Scroll one full page down |
| `Ctrl + b` | Scroll one full page up |
| `Ctrl + d` | Scroll half page down |
| `Ctrl + u` | Scroll half page up |

### 🟠 Editing (Insert & Change)
| Command | Action |
| :--- | :--- |
| `i` | Enter Insert mode at the cursor |
| `I` | Enter Insert mode at the beginning of the line |
| `a` | Enter Insert mode **after** the cursor (append) |
| `A` | Enter Insert mode at the end of the line |
| `o` | Open a new line **below** the current line and enter Insert mode |
| `O` | Open a new line **above** the current line and enter Insert mode |
| `r` | Replace a single character under the cursor |
| `R` | Enter Replace mode (overwrites text) |
| `Esc` | Exit Insert mode; return to Normal mode |

### 🔴 Deleting, Copying & Pasting
| Command | Action |
| :--- | :--- |
| `x` | Delete character under the cursor |
| `dd` | Delete (cut) the current line |
| `dw` | Delete (cut) from cursor to next word |
| `D` | Delete (cut) from cursor to the end of the line |
| `yy` | Copy (yank) the current line |
| `y[Number]y` | Copy a specific number of lines (e.g., `y2y`) |
| `p` | Paste the deleted/copied text **after** the cursor |
| `P` | Paste the deleted/copied text **before** the cursor |
| `u` | **Undo** the last action |
| `Ctrl + r` | **Redo** the last undone action |
| `.` | Repeat the previous command |

### 🔵 Search & Replace
| Command | Action |
| :--- | :--- |
| `/{pattern}` | Search forward for the pattern |
| `?{pattern}` | Search backward for the pattern |
| `n` | Repeat search in the same direction |
| `N` | Repeat search in the opposite direction |
| `:%s/old/new/g` | Replace all occurrences of "old" with "new" in the file |
| `:%s/old/new/gc` | Replace all with a prompt for confirmation |
| `gd` | Jump to local definition of symbol under cursor |
| `gD` | Jump to global definition of symbol under cursor |

### 🟡 Visual Mode (Selecting)
| Command | Action |
| :--- | :--- |
| `v` | Enter Visual mode (character-wise selection) |
| `V` | Enter Visual Line mode (line-wise selection) |
| `Ctrl + v` | Enter Visual Block mode (column selection) |
| `> ` | Indent selected text |
| `< ` | De-indent selected text |

### ⚙️ UI & File Management
| Command | Action |
| :--- | :--- |
| `:set nu` | Turn on line numbers |
| `:set nonu` | Disable line numbers |
| `:set relativenumber` | Show line numbers relative to cursor position |
| `>>` | Indent current line |
| `<<` | De-indent current line |
| `:w` | Save (write) the file |
| `:wq` | Save and Quit |
| `:q!` | Quit without saving changes |
| `:x` | Save and Quit (only writes if changes were made) |