-- Setup treesitter
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' },
})

-- Setup orgmode
require('orgmode').setup({
    org_agenda_files = '~/orgfiles/**/*',
    org_default_notes_file = '~/orgfiles/refile.org',
    win_split_mode = 'bot 16new',
    org_capture_templates = {
        T = {
            description = 'Todo',
            template = '* TODO %?\n  SCHEDULED: %t',
            target = '~/orgfiles/todo.org',
        },
        d = {
            description = 'Deadline',
            template = '* TODO %?\n  DEADLINE: %t',
            target = '~/orgfiles/todo.org',
        }
    },
})
