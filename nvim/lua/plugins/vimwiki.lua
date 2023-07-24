vim.g.vimwiki_list = {
    {
        path = '/home/rob/Documents/docs',
        name = 'Docs',
        syntax = 'markdown',
        ext = '.md',
        index = 'readme',
        diary_rel_path = 'journals/',
        template_date_format = '%Y_%m_%d'
    }
}
return {
    'vimwiki/vimwiki',
}
