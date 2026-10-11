# Neovim Guide

This Neovim configuration is designed for editing code with language-server support, fuzzy search, completion,
formatting, diagnostics, and Git integration.

The most important convention is that `Space` is the **leader key**. For example, `<leader>sg` means press `Space`, then
`s`, then `g`.

## First things to know

Neovim has modes. The most commonly used are:

- **Normal mode**: navigate and run commands. Press `Esc` to return here.
- **Insert mode**: type text. Press `i` to enter it.
- **Visual mode**: select text. Press `v` for characters, `V` for lines, or `Ctrl-v` for a block.
- **Command-line mode**: run commands such as `:w` or `:help`. Press `:` from Normal mode.

Useful basic commands:

| Action                                   | Keys or command                      |
| ---------------------------------------- | ------------------------------------ |
| Start inserting before the cursor        | `i`                                  |
| Start inserting at the end of the line   | `A`                                  |
| Save                                     | `:w`                                 |
| Quit                                     | `:q`                                 |
| Save and quit                            | `:wq`                                |
| Quit without saving                      | `:q!`                                |
| Open a file                              | `:edit path/to/file`                 |
| Undo / redo                              | `u` / `Ctrl-r`                       |
| Search forward in the current file       | `/pattern`                           |
| Move to the next / previous search match | `n` / `N`                            |
| Show help                                | `:help subject`                      |
| Show available mappings                  | `:Telescope keymaps` or `<leader>sk` |

The configuration uses relative line numbers. In Normal mode, a number followed by `j` or `k` moves that many lines. On
wrapped lines, `j` and `k` move by displayed line; use a count when you want file-line movement.

## Completion

Completion normally appears automatically while typing. Its sources include language-server suggestions, file paths, Lua
snippets, and Neovim API information in Lua files.

In Insert mode:

| Action                                     | Key                 |
| ------------------------------------------ | ------------------- |
| Trigger completion manually                | `Ctrl-Space`        |
| Select the next item                       | `Ctrl-n`            |
| Select the previous item                   | `Ctrl-p`            |
| Accept the selected completion             | `Enter`             |
| Scroll completion documentation up / down  | `Ctrl-b` / `Ctrl-f` |
| Jump forward through snippet placeholders  | `Ctrl-l`            |
| Jump backward through snippet placeholders | `Ctrl-h`            |

Pressing `Enter` accepts the currently selected item, including a completion that can expand into a snippet. Function
and method completions also integrate with automatic parentheses.

If `Ctrl-Space` does not trigger completion, the terminal may be intercepting or not transmitting that key combination.
Automatic completion should still work; you can also inspect the mapping with `:verbose imap <C-Space>`.

## Definitions, references, and types

These mappings are added when a language server attaches to the current buffer. They open results in Telescope, so you
can type to filter and press `Enter` to jump to a result.

Put the cursor on a symbol first.

| Action                             | Key                              |
| ---------------------------------- | -------------------------------- |
| Go to definition                   | `gd`                             |
| Find all references                | `gr`                             |
| Go to implementation               | `gI`                             |
| Go to type definition              | `<leader>D` (`Space`, `Shift-d`) |
| Go to declaration                  | `gD`                             |
| Find symbols in the current file   | `<leader>ds`                     |
| Find symbols across the workspace  | `<leader>ws`                     |
| Rename the symbol                  | `<leader>rn`                     |
| Run a code action                  | `<leader>ca`                     |
| Toggle inlay hints, when supported | `<leader>th`                     |

The distinction between the navigation commands is useful:

- `gd` finds where a variable, function, or type is defined.
- `gD` finds its declaration, which can be different from its implementation—for example, a declaration in a C header.
- `<leader>D` finds the definition of the symbol's type.
- `gr` finds usages or references throughout the project.
- `gI` finds implementations of an interface, protocol, or abstract declaration.

After jumping, use `Ctrl-o` to go back to the previous location and `Ctrl-i` to go forward again. `Ctrl-t` is also
useful for returning from a definition jump.

If one of these mappings does nothing, check that the file type has a language server configured and that the server
attached successfully. Use `:LspInfo` while the file is open.

When the cursor rests on a supported symbol, the language server may highlight other references automatically. These
highlights disappear when the cursor moves.

## Searching code and files

This configuration uses Telescope for fuzzy finding.

### Project and file search

| Action                               | Key                |
| ------------------------------------ | ------------------ |
| Find files                           | `<leader>sf`       |
| Find files, including hidden files   | `<leader>sa`       |
| Search text across the project       | `<leader>sg`       |
| Search for the word under the cursor | `<leader>sw`       |
| Search open files                    | `<leader>s/`       |
| Search within the current buffer     | `<leader>/`        |
| Find an existing buffer              | `<leader><leader>` |
| Open a recent file                   | `<leader>s.`       |
| Search Neovim configuration files    | `<leader>sn`       |
| Resume the previous Telescope search | `<leader>sr`       |
| Search diagnostics                   | `<leader>sd`       |

For `<leader>sg`, enter any text to search for across the project. For `<leader>sw`, place the cursor on a word before
invoking it. In a Telescope window, type to filter, press `Enter` to open the selected result, and press `Esc` to close
it. Press `?` in a Telescope window to see picker-specific commands.

`live_grep` normally uses `rg` (ripgrep). If project-wide text search fails, install ripgrep and ensure `rg` is
available on your `PATH`.

### File tree and buffers

- Press `\` to open a floating Neo-tree file browser focused on the current file.
- Press `\` again inside Neo-tree to close it.
- `Shift-l` / `Shift-h` cycle to the next / previous buffer.
- `<leader>bn` / `<leader>bp` cycle buffers.
- `<leader>bb` lets you pick a buffer visually.
- `<leader>bd` deletes the current buffer.
- `<leader>bc` lets you pick a buffer to close.

## Diagnostics

Diagnostics are messages from language servers and linters, shown in the sign column and buffer.

| Action                               | Key          |
| ------------------------------------ | ------------ |
| Previous diagnostic                  | `[d`         |
| Next diagnostic                      | `]d`         |
| Show the diagnostic under the cursor | `<leader>e`  |
| Open the diagnostics location list   | `<leader>q`  |
| Search diagnostics with Telescope    | `<leader>sd` |

The configuration runs `markdownlint` for Markdown when that executable is installed. Language-server diagnostics depend
on the active server.

## Formatting

- Format the current buffer: `<leader>f`
- Format on save is enabled when a configured formatter or language server is available.
- Lua uses `stylua` when installed.
- Gleam uses the Gleam formatter when the `gleam` executable is available.

Use `:ConformInfo` to see which formatter Conform can use for the current buffer.

## Language servers and tools

Mason manages language servers and tools for this configuration. The configured servers include:

- `lua_ls` for Lua
- `jsonls` for JSON, including a Dev Container schema for `devcontainers.json`
- Gleam support when `gleam` is installed on the system
- OCaml support when `ocamllsp` is installed on the system

The configuration also installs or manages tools such as `stylua` and `json-lsp` through Mason.

Useful commands:

| Command        | Purpose                                                       |
| -------------- | ------------------------------------------------------------- |
| `:Mason`       | View and install language servers and tools                   |
| `:LspInfo`     | See which language servers are attached to the current buffer |
| `:checkhealth` | Run Neovim health checks                                      |
| `:messages`    | View recent messages and errors                               |
| `:Lazy`        | Inspect and manage plugins                                    |
| `:Lazy sync`   | Update and synchronize plugins                                |

For LSP navigation to work, the relevant language server must be installed, the file must have the expected file type,
and the server must recognize the project root. Opening a file inside its project is usually enough.

## Git and editing helpers

Git changes are shown in the sign column through Gitsigns.

| Action                   | Key          |
| ------------------------ | ------------ |
| Previous Git hunk        | `<leader>gp` |
| Next Git hunk            | `<leader>gn` |
| Preview the current hunk | `<leader>ph` |

Other editing conveniences include:

- In Visual mode, `J` and `K` move the selected lines down and up while preserving the selection.
- `<leader>y` copies to the system clipboard; `<leader>Y` copies the current line.
- `<leader>dd` deletes a line without overwriting the clipboard.
- In Visual mode, `<leader>d` deletes the selection without overwriting the clipboard.
- `mini.ai` provides text objects such as `ci'`, `va)`, and `yinq`.
- `mini.surround` provides surrounding-text commands such as `saiw)`, `sd'`, and `sr)'`.
- `Q` is disabled to avoid accidentally entering Ex mode.

## Discovering commands

Which-key displays available key chains after pressing `Space`. This is especially useful for the search (`Space-s`),
code (`Space-c`), document (`Space-d`), workspace (`Space-w`), toggle (`Space-t`), and Git hunk (`Space-h`) groups.

Other ways to discover functionality:

- `<leader>sh` searches Neovim help tags.
- `<leader>sk` searches all keymaps.
- `:Telescope builtin` or `<leader>ss` lists Telescope pickers.
- In Telescope, press `?` for the current picker's full keymap.
- Use `:help <topic>` for built-in documentation, such as `:help ins-completion`, `:help lsp`, or `:help motion.txt`.

## A typical code-navigation workflow

1. Open a project file with `:edit`, `\`, or `<leader>sf`.
2. Place the cursor on a function or type and press `gd` to inspect its definition.
3. Press `Ctrl-o` to return.
4. Press `gr` to see every reference to the symbol.
5. Use `<leader>sg` for a textual search when you need to search comments, strings, or files that are not understood by
   the language server.
6. Use `<leader>ca` for an LSP-provided fix or `<leader>rn` to rename a symbol across the project.
7. Use `<leader>f` to format the buffer, then save with `:w`.

## Troubleshooting checklist

When completion or code navigation is unavailable:

1. Confirm the file has the expected file type with `:set filetype?`.
2. Run `:LspInfo` and check whether a server is attached.
3. Open `:Mason` and verify that the required server or tool is installed.
4. Confirm the project has a recognizable root, commonly a Git repository or language-specific project file.
5. Run `:checkhealth` and inspect `:messages` for startup or plugin errors.
6. Restart Neovim after installing a new language server or changing the project environment.

Remember that `gd`, `gr`, `<leader>D`, and the other LSP mappings are buffer-local. Their presence and behavior can
therefore vary by file type and by language-server capabilities.
