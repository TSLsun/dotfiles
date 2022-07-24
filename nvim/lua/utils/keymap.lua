-- ref: https://github.com/glepnir/cosynvim/blob/main/lua/core/keymap.lua
-- License: MIT
local keymap = {}
local opts = {}

function keymap.cmd(str)
  return '<cmd>' .. str .. '<CR>'
end

-- visual
function keymap.cu(str)
  return '<C-u><cmd>' .. str .. '<CR>'
end

function keymap.silent(opt)
  return function()
    opt.silent = true
  end
end

function keymap.noremap(opt)
  return function()
    opt.noremap = true
  end
end

function keymap.expr(opt)
  return function()
    opt.expr = true
  end
end

function keymap.remap(opt)
  return function()
    opt.remap = true
  end
end

function keymap.nowait(opt)
  return function()
    opt.nowait = true
  end
end

function opts:new(instance)
  instance = instance
      or {
        options = {
          silent = false,
          nowait = false,
          expr = false,
          noremap = false,
        },
      }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function keymap.new_opts(...)
  local args = { ... }
  local o = opts:new()

  if #args == 0 then
    return o.options
  end

  for _, arg in pairs(args) do
    if type(arg) == 'string' then
      o.options.desc = arg
    else
      arg(o.options)()
    end
  end
  return o.options
end

--@private
local keymap_set = function(mode, tbl)
  vim.validate({
    tbl = { tbl, 'table' },
  })
  local len = #tbl
  if len < 2 then
    vim.notify('keymap must has rhs')
    return
  end

  local options = len == 3 and tbl[3] or keymap.new_opts()

  vim.keymap.set(mode, tbl[1], tbl[2], options)
end

local function _map(mod)
  return function(tbl)
    vim.validate({
      tbl = { tbl, 'table' },
    })

    if type(tbl[1]) == 'table' and type(tbl[2]) == 'table' then
      for _, v in pairs(tbl) do
        keymap_set(mod, v)
      end
    else
      keymap_set(mod, tbl)
    end
  end
end

local keymap_set_with_args = function(mode, tbl, ...)
  vim.validate({
    tbl = { tbl, 'table' },
  })
  local len = #tbl
  if len < 2 then
    vim.notify('keymap must has rhs')
    return
  end

  local options = len == 3 and tbl[3] or keymap.new_opts()

  local preset_args = { ... }
  for _, arg in pairs(preset_args) do
    arg(options)()
  end

  vim.keymap.set(mode, tbl[1], tbl[2], options)
end

function keymap.map(mod, ...)
  local args = { ... }

  if #args == 0 then
    return _map(mod)
  end

  return function(tbl)
    vim.validate({
      tbl = { tbl, 'table' },
    })

    if type(tbl[1]) == 'table' and type(tbl[2]) == 'table' then
      for _, v in pairs(tbl) do
        keymap_set_with_args(mod, v, unpack(args))
      end
    else
      keymap_set_with_args(mod, tbl, unpack(args))
    end
  end
end

-- Usages
keymap.nmap = keymap.map('n')
keymap.nnoremap = keymap.map('n', keymap.noremap)
keymap.vnoremap = keymap.map('v', keymap.noremap)
keymap.inoremap = keymap.map('i', keymap.noremap)
keymap.xnoremap = keymap.map('x', keymap.noremap)

return keymap
