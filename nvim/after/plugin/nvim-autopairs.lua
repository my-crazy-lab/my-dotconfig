local statusAutoPair, autopairs = pcall(require, "nvim-autopairs")
if (not statusAutoPair) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
