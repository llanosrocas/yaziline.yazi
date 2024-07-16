local function setup()
  function Header:count()
    return ui.Line {}
  end

  function Status:mode()
    local mode = tostring(self._tab.mode):upper()
    if mode == "UNSET" then
      mode = "UN-SET"
    end

    local style = self:style()
    return ui.Line {
      ui.Span(" " .. mode .. " "):style(style),
    }
  end

  function Status:size()
    local h = self._tab.current.hovered
    if not h then
      return ui.Line {}
    end

    local style = self:style()
    return ui.Line {
      ui.Span(THEME.status.separator_close .. " " .. ya.readable_size(h:size() or h.cha.length) .. " "):fg(style.bg):bg(THEME.status.separator_style.bg),
    }
  end

  function Status:name()
    local h = self._tab.current.hovered
    if not h then
      return ui.Line {}
    end

    local trimmed_name = #h.name > 24 and (string.sub(h.name, 1, 6) .. "..." .. string.sub(h.name, -6)) or h.name

    local style = self:style()
    return ui.Line {
      ui.Span(THEME.status.separator_close .. " "):fg(THEME.status.separator_style.fg),
      ui.Span(trimmed_name):fg(style.bg),
    }
  end

  function Status:files()
    local files_yanked = #cx.yanked
    local files_selected = #cx.active.selected
    local files_is_cut = cx.yanked.is_cut

    local selected_fg = files_selected > 0 and THEME.manager.marker_selected.bg or THEME.status.separator_style.fg
    local yanked_fg = files_yanked > 0 and
    (files_is_cut and THEME.manager.marker_cut.bg or THEME.manager.marker_copied.bg) or
    THEME.status.separator_style.fg

    local select_symbol = "S"
    local yank_symbol = "Y"

    local yanked_text = files_yanked > 0 and yank_symbol .. " " .. files_yanked or yank_symbol .. " 0"

    return ui.Line {
        ui.Span("  "):fg(THEME.status.separator_style.fg),
        ui.Span(select_symbol .. " " .. files_selected .. " "):fg(selected_fg),
        ui.Span(yanked_text .. "  "):fg(yanked_fg),
    }
  end

  function Status:modified()
    local hovered = cx.active.current.hovered
    local cha = hovered.cha
    local time = (cha.modified or 0) // 1

    return ui.Line {
      ui.Span(os.date("%Y-%m-%d %H:%M", time) .. "  "):fg(THEME.status.separator_style.fg),
    }
  end

  function Status:permissions()
    local h = self._tab.current.hovered
    if not h then
      return ui.Line {}
    end

    local perm = h.cha:permissions()
    if not perm then
      return ui.Line {}
    end

    local spans = {}
    for i = 1, #perm do
      local c = perm:sub(i, i)
      local style = THEME.status.permissions_t
      if c == "-" or c == "?" then
        style = THEME.status.permissions_s
      elseif c == "r" then
        style = THEME.status.permissions_r
      elseif c == "w" then
        style = THEME.status.permissions_w
      elseif c == "x" or c == "s" or c == "S" or c == "t" or c == "T" then
        style = THEME.status.permissions_x
      end
      spans[i] = ui.Span(c):style(style)
    end
    return ui.Line(spans)
  end

  function Status:percentage()
    local percent = 0
    local cursor = self._tab.current.cursor
    local length = #self._tab.current.files
    if cursor ~= 0 and length ~= 0 then
      percent = math.floor((cursor + 1) * 100 / length)
    end

    if percent == 0 then
      percent = "  Top "
    elseif percent == 100 then
      percent = "  Bot "
    else
      percent = string.format(" %3d%% ", percent)
    end

    local style = self:style()
    return ui.Line {
      ui.Span(" " .. THEME.status.separator_open):fg(THEME.status.separator_style.fg),
      ui.Span(percent):fg(style.bg):bg(THEME.status.separator_style.bg),
      ui.Span(THEME.status.separator_open):fg(style.bg):bg(THEME.status.separator_style.bg)
    }
  end

  function Status:position()
    local cursor = self._tab.current.cursor
    local length = #self._tab.current.files

    local style = self:style()
    return ui.Line {
      ui.Span(string.format(" %2d/%-2d ", cursor + 1, length)):style(style),
    }
  end

  Status._left = {
    { Status.mode, id = 1, order = 1000 },
    { Status.size, id = 2, order = 2000 },
    { Status.name, id = 3, order = 3000 },
    { Status.files, id = 4, order = 4000 },
  }
    Status._right = {
    { Status.modified, id = 5, order = 5000 },
    { Status.permissions, id = 6, order = 6000 },
    { Status.percentage, id = 7, order = 7000 },
    { Status.position, id = 8, order = 8000 },
  }
end

return { setup = setup }