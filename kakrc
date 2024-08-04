#set-option global scrolloff 30,0

add-highlighter global/ number-lines -relative
add-highlighter global/ wrap -word
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces

map global normal <c-s> ':write-all<ret>'
map global insert <c-s> '<a-;>:write-all<ret>'
map global normal <c-x> ':write-all;quit<ret>'
map global insert <c-x> '<a-;>:write-all;quit<ret>'

map global normal <F5> ':%val{ buffile }<ret>'

source "%val{config}/plugins.kak"
