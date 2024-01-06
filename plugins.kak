bundle kakboard" "https://github.com/lePerdu/kakboard" %{
	hook global WinCreate .* %{ kakboard-enable }
}

bundle kakoune-vertical-selection "https://github.com/occivink/kakoune-vertical-selection"
bundle kakoune-text-objects "https://github.com/Delapouite/kakoune-text-objects"
bundle kakoune-multi-file "https://github.com/natasky/kakoune-multi-file"

bundle kakoune-auto-percent" "https://github.com/delapouite/kakoune-auto-percent" 

bundle kak-rainbower "https://github.com/crizan/kak-rainbower" %{
	hook global WinCreate .* rainbow-enable-window
}
bundle-install-hook kak-rainbower %{
	gcc rc/rainbower.cpp -O2 -o rc/rainbower
}

bundle kak-tree-sitter "https://github.com/phaazon/kak-tree-sitter"
bundle-install-hook kak-tree-sitter %{
	cargo install --locked --path kak-tree-sitter --root ${HOME}/.local
	cargo install --locked --path ktsctl --root ${HOME}/.local
}

bundle smarttab.kak "https://github.com/andreyorst/smarttab.kak"

# bundle tabs.kak "https://github.com/enricozb/tabs.kak"
## bundle-install-hook tabs.kak %{ ## cargo install --locked --path . --root ${HOME}/.local
## }

bundle kak-lsp "https://github.com/kak-lsp/kak-lsp"
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

