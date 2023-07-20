require('wilder').setup({ 
    modes = { ':','/', '?'},
})

local wilder = require('wilder')
wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlighter = wilder.basic_highlighter(),
            highlights = {
                border = 'Normal',
                accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#eba0ac'}})
            },
            border = 'rounded',
            reverse = 1,
            left = { ' ', wilder.popupmenu_devicons()},
            right = { ' ', wilder.popupmenu_scrollbar()}
        })
    ),
    ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
    })
}))
