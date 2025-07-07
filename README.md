# yaziline.yazi

Simple lualine-like status line for yazi.

![angly](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/angly.png)
![preview-fullscreen](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/preview-fullscreen.png)

All supported features are listed [here](#features). More presets are available [here](#presets).

## Requirements

- yazi version >= [917e1f5](https://github.com/sxyazi/yazi/commit/917e1f54a10445f2e25147c4b81a3c77d8233632)
- Font with symbol support. For example [Nerd Fonts](https://www.nerdfonts.com/).

## Installation

1. Using yazi package manager

```sh
ya pkg add llanosrocas/yaziline
```

_Or manually copy `main.lua` to the `~/.config/yazi/plugins/yaziline.yazi/main.lua`_

2. Add this line to your `~/.config/yazi/init.lua`:

```lua
require("yaziline"):setup()
```

## Configuration

This is default config, if you want to see presets go to [this section](#presets).

```lua
require("yaziline"):setup({
  color = "#98c379",
  secondary_color = "#5A6078",
  default_files_color = "darkgray", -- color of the file counter when it's inactive
  selected_files_color = "white",
  yanked_files_color = "green",
  cut_files_color = "red",

  separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
  separator_open = "",
  separator_close = "",
  separator_open_thin = "",
  separator_close_thin = "",
  separator_head = "",
  separator_tail = "",

  select_symbol = "",
  yank_symbol = "󰆐",

  filename_max_length = 24, -- truncate when filename > 24
  filename_truncate_length = 6, -- leave 6 chars on both sides
  filename_truncate_separator = "..."
})
```

By default yaziline uses color values from your `theme.toml`:

- mode and position font color: th.which.mask.bg
- default_files_color: which.separator_style.fg
- selected_files_color: mgr.count_selected.bg
- yanked_files_color: mgr.count_copied.bg
- cut_files_color: mgr.count_cut.bg

```
 MODE  size  long_file...name.md  S 0 Y 0
|  |   |   |  |           |         | |   |
|  |   |   |  |           |         | |   └─── yank_symbol
|  |   |   |  |           |         | └─────── select_symbol
|  |   |   |  |           |         └───────── separator_close_thin
|  |   |   |  |           └─────────────────── filename_truncate_separator
|  |   |   |  └─────────────────────────────── separator_close
|  |   |   └────────────────────────────────── secondary_color
|  |   └────────────────────────────────────── separator_close
|  └────────────────────────────────────────── color
└───────────────────────────────────────────── separator_head
```

## Features

### Presets

- `angly`
  ![angly](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/angly.png)
- `curvy`
  ![curvy](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/curvy.png)
- `liney`
  ![liney](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/liney.png)
- `empty`
  ![empty](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/empty.png)

### Selected and Yanked Counter

Displays the number of selected ('S') and yanked ('Y') files on the left. If files are cut, the yank counter changes color, since its `yank --cut` under the hood.

### Truncated filename

Displays the truncated filename on the left, which is useful for smaller windows or long filenames. By default, it's 24 characters with trimming to 12 (6 + 6). Adjust in the `setup`.

```lua
require("yaziline"):setup({
  filename_max_length = 24,
  filename_truncate_length = 6,
  filename_truncate_separator = "..."
})
```

### ISO Date for 'Modified'

On the right, you'll find the date and time the file was modified, formatted in an [ISO](https://en.wikipedia.org/wiki/ISO_8601)-like string for universal date representation. Adjust in the `Status:date` function.

## Credits

- [yazi source code](https://github.com/sxyazi/yazi)
- [yatline.yazi](https://github.com/imsi32/yatline.yazi/tree/main)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
