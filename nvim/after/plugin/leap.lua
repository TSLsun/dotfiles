--require('leap').add_default_mappings()

vim.keymap.set('n', '<Space><Space>', '<Plug>(leap-forward-to)')
vim.keymap.set('n', '<leader><Space><Space>', '<Plug>(leap-backward-to)')
vim.keymap.set('n', 'g<Space><Space>', '<Plug>(leap-cross-window)')

vim.keymap.set({ 'v', 'o' }, '<Space><Space>', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'v', 'o' }, '<leader><Space><Space>', '<Plug>(leap-backward-to)')

vim.keymap.set({ 'x', 'o' }, 'x', '<Plug>(leap-forward-till)')
vim.keymap.set({ 'x', 'o' }, 'X', '<Plug>(leap-backward-till)')
