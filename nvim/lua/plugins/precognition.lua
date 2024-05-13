return {
    'tris203/precognition.nvim',
    config = {
        startVisible = true,
        showBlankVirtLine = false,
        hints = {
            Caret = { text = "^", prio = 0 },
            Dollar = { text = "$", prio = 0 },
            w = { text = "w", prio = 0 },
            b = { text = "b", prio = 0 },
            e = { text = "e", prio = 0 },
        },
        gutterHints = {
            --prio is not currentlt used for gutter hints
            G = { text = "G", prio = 1 },
            gg = { text = "gg", prio = 1 },
            PrevParagraph = { text = "{", prio = 1 },
            NextParagraph = { text = "}", prio = 1 },
        },
    },
}
