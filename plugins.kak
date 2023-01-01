bundle kakboard "https://github.com/lePerdu/kakboard" %{
	hook global WinCreate .* %{ kakboard-enable }
	set global kakboard_copy_keys 'y' 'd'
}

bundle kakoune-vertical-selection "https://github.com/occivink/kakoune-vertical-selection"
bundle kakoune-text-objects "https://github.com/Delapouite/kakoune-text-objects"
bundle kakoune-auto-percent "https://github.com/delapouite/kakoune-auto-percent" 
bundle kakoune-auto-star "https://github.com/delapouite/kakoune-auto-star" 
bundle kakoune-sudo-write "https://github.com/occivink/kakoune-sudo-write.git"

bundle inc-dec "https://gitlab.com/Screwtapello/kakoune-inc-dec.git" %{
	map global normal = ': inc-dec-modify-numbers + %val{count}<ret>'
	map global normal <minus> ': inc-dec-modify-numbers - %val{count}<ret>'
}

bundle kak-rainbower "https://github.com/crizan/kak-rainbower" %{
	hook global WinCreate .* rainbow-enable-window
	set global rainbow_mode 0
}
bundle-install-hook kak-rainbower %{
	gcc rc/rainbower.cpp -O2 -o rc/rainbower
}

bundle kak-tree-sitter "https://github.com/jcomcl/kak-tree-sitter" %{
	nop %sh{ kak-tree-sitter -dks --init $kak_session }

	define-command tree-sitter-debug %{
	    tree-sitter-shutdown
	    nop %sh{
	        newterm kak-tree-sitter --server -vvvvv --init $kak_session
	    }
	}
}
bundle-install-hook kak-tree-sitter %{
	cargo install --locked --path kak-tree-sitter --root ${HOME}/.local
}
bundle kak-lsp "https://github.com/kak-lsp/kak-lsp" %{
	set-option global lsp_file_watch_support true
	lsp-enable
	# Keybinds
	map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'
	map global user r ':lsp-restart<ret>' -docstring 'Restart LSP'

	map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
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
