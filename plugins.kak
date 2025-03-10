bundle kakboard "https://github.com/lePerdu/kakboard" %{
	hook global WinCreate .* %{ kakboard-enable }
}

bundle kakoune-vertical-selection "https://github.com/occivink/kakoune-vertical-selection"
bundle kakoune-text-objects "https://github.com/Delapouite/kakoune-text-objects"
bundle kakoune-auto-percent "https://github.com/delapouite/kakoune-auto-percent" 
bundle kakoune-auto-star "https://github.com/delapouite/kakoune-auto-star" 
bundle kakoune-sudo-write "https://github.com/occivink/kakoune-sudo-write.git"
bundle kak-inc-dec "https://gitlab.com/Screwtapello/kakoune-inc-dec.git"

bundle kak-rainbower "https://github.com/crizan/kak-rainbower" %{
	hook global WinCreate .* rainbow-enable-window
}
bundle-install-hook kak-rainbower %{
	gcc rc/rainbower.cpp -O2 -o rc/rainbower
}

bundle kak-tree-sitter "https://git.sr.ht/~hardonized/kak-tree-sitter"
bundle-install-hook kak-tree-sitter %{
	cargo install --locked --path kak-tree-sitter --root ${HOME}/.local
	cargo install --locked --path ktsctl --root ${HOME}/.local
}

bundle kak-lsp "https://github.com/kak-lsp/kak-lsp" %{
	set-option global lsp_file_watch_support true
	lsp-enable
	# Keybinds
	map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'
	map global user r ':lsp-restart<ret>' -docstring 'Restart LSP'

	map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

	map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
	map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
	map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
	map global object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
	map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
	map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

	#hook global WinCreate .*\.gd '%{hook window NormalIdle lsp-restart}'

}
bundle-install-hook kak-lsp %{
	cargo install --locked --path . --root ${HOME}/.local
	# optional: if you want to use specific language servers
	mkdir -p ~/.config/kak-lsp
	cp -n kak-lsp.toml ~/.config/kak-lsp/
}

bundle kak-dap "https://github.com/jdugan6240/kak-dap"
bundle-install-hook kak-dap %{
	cargo install --locked --path . --root ${HOME}/.local
}
