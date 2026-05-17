require("zen-mode").setup {
  window = {
    width = 90,
    options = {
      number = true,
      relativenumber = true,
    }
  },
}

function ToggleZenMode()
  require("zen-mode").toggle()
  vim.wo.wrap = false
  ColorMyPencils()
end

vim.keymap.set("n", "<space>zz", ToggleZenMode)
