# yaziline.yazi

Simple lualine-like line for yazi.

Read more about features and configuration [here](#features).

![preview](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/preview.png)

## Requirements

yazi version >= 0.3.0

## Installation

```sh
ya pack -a llanosrocas/yaziline
```

## Usage

Add this to your `~/.config/yazi/init.lua`:

```lua
require("yaziline"):setup()
```

Change separators in the `theme.toml`:

```toml
[status]
separator_open  = ""
separator_close = ""
```

## Features

### Colors and font weight

You can change background and font weight in your `yazi/flavors/flavor.toml`.

```toml
mode_normal = { bg = "#98c379", bold = false }
```

For example, here is how my line looks like:

![preview-2](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/preview-2.png)

### Selected and Yanked Counter

Displays the number of selected ('S') and yanked ('Y') files on the left. If files are cut, the yank counter changes color, since its `yank --cut` under the hood.

### Trimmed Filename

Shows the trimmed filename on the left, useful for smaller screens or when using Yazi in a smaller window. By default, it's 24 characters with trimming to 12. Adjust in the `Status:name` function.

### ISO Date for 'Modified'

On the right, you'll find the date and time the file was modified, formatted in an [ISO](https://en.wikipedia.org/wiki/ISO_8601)-like string for universal date representation. Adjust in the `Status:date` function.

## Credits

- [yazi source code](https://github.com/sxyazi/yazi)
- [yatline.yazi](https://github.com/imsi32/yatline.yazi/tree/main)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
