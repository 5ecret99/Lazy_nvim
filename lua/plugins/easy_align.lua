return {
    {
        "junegunn/vim-easy-align",
        config = function()
            -- Any additional setup for vim-easy-align
            vim.cmd [[ let g:easy_align_ignore_groups = ['String'] ]]
        end,
    },
}
