# yaziline.yazi

Simple lualine-like line for yazi.

Read more about features and configuration [here](#features).

![preview](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/preview.png)

## Requirements

- yazi version >= 0.3.0
- Font with symbol support. For example [Nerd Fonts](https://www.nerdfonts.com/).

## Installation

```sh
ya pack -a llanosrocas/yaziline
```

## Usage

Add this to your `~/.config/yazi/init.lua`:

```lua
require("yaziline"):setup()
```

Optionally, configure `separator_style`:

```lua
require("yaziline"):setup({
  separator_style = "angly" -- "angly" | "curvy" | "empty"
})
```

## Features

### Preconfigured separators

Choose your style:

- `angly`
  ![angly](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/angly.png)
- `curvy`
  ![curvy](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/curvy.png)
- `empty`
  ![empty](https://github.com/llanosrocas/yaziline.yazi/blob/master/.github/images/empty.png)

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
