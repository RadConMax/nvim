return {
    '3rd/image.nvim',
    dependencies = {
        {
            'vhyrro/luarocks.nvim',
            priority = 1001,
            opts = {
                rocks = { 'magick' },
            },
        },
    },
    build = false,
    opts = {},
}
