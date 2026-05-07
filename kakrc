#set-option global scrolloff 30,0

add-highlighter global/ number-lines -relative
add-highlighter global/ wrap -word
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces

map global normal <c-s> ':write-all<ret>'
map global insert <c-s> '<esc>:write-all<ret>'
map global normal <c-x> ':write-all;quit<ret>'
map global insert <c-x> '<a-;>:write-all;quit<ret>'

map global user t ':nop %sh{newterm}<ret>'
map global user f ':nop %sh{newterm lf}<ret>'

define-command xdg-open -params 1 'echo %sh{
    xdg-open $@
}'

map global user o ':xdg-open %val{selection}'

# Bufrun
declare-option str bufrunner_window 'newterm holder'
declare-option str bufrunner
define-command bufrun 'echo %sh{
    $kak_opt_bufrunner_window $kak_opt_bufrunner $kak_buffile
}'
map global normal <F5> ':bufrun<ret>'

hook global BufCreate .*\.gd %{
    set-option buffer bufrunner_window 'newterm'
    set-option buffer bufrunner 'project-root godot'
}
hook global BufCreate .*\.html %{
    set-option buffer bufrunner_window ''
    set-option buffer bufrunner %sh{echo $BROWSER}
}
hook global BufCreate .*\.py %{
    set-option buffer bufrunner 'python'
}
hook global BufCreate .*\.c %{
    set-option buffer bufrunner 'ccr'
}

source "%val{config}/plugins.kak"

colorscheme xvi
