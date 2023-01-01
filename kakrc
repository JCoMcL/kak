map global normal <c-s> ':write-all<ret>'
map global insert <c-s> '<esc>:write-all<ret>'
map global normal <c-x> ':write-all;quit<ret>'
map global insert <c-x> '<a-;>:write-all;quit<ret>'

define-command split -params 0..1 %{
    echo %sh{ env -C "$(dirname $kak_buffile)" newterm $@ }
}
map global user t ':split<ret>'
map global user f ':split lf<ret>'
map global user v ':vertical-selection-down<ret>'

# The default mappings for ] and [ don't seem useful but are much more ergonomic
map global normal ] <a-a>
map global normal [ <a-i>

define-command xdg-open -params 1 'echo %sh{
    xdg-open $@
}'

map global user o ':xdg-open %val{selection}<ret>'

# Bufrun
declare-option str bufrunner_window 'newterm holder'
declare-option str bufrunner
define-command bufrun 'echo %sh{
    $kak_opt_bufrunner_window $kak_opt_bufrunner $kak_buffile
}'
map global normal <F5> ':bufrun<ret>'

hook global BufCreate .*\.gd %{
    #set-option buffer bufrunner_window 'newterm'
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
hook global BufCreate .*\.odin %{
    set-option buffer bufrunner 'project-root odin run src'
}
hook global BufCreate .*\.glsl %{
    set-option buffer bufrunner 'project-root make clean run' #HACK
}
hook global BufCreate Makefile %{
    set-option buffer bufrunner 'project-root make clean run' #HACK
}
source "%val{config}/plugins.kak"

add-highlighter global/ number-lines -relative
add-highlighter global/ wrap -word
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces

hook global BufCreate .* %{
	set buffer autoreload yes # what could go wrong?
}

colorscheme xvi

