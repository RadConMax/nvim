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
    opts = {
        integrations = {
            markdown = {
                only_render_image_at_cursor = true,
            },
        },
    },
}
