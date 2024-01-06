bundle "https://github.com/lePerdu/kakboard" %{
    hook global WinCreate .* %{ kakboard-enable }
}


bundle "https://github.com/natasky/kakoune-multi-file"

bundle "https://github.com/delapouite/kakoune-auto-percent" %{
    hook global WinCreate .* rainbow-enable-window
}

bundle "https://github.com/jdugan6240/kak-dap"
bundle-install-hook kak-dap %{
    cargo install --locked --path . --root ${HOME}/.local

}

bundle "https://github.com/crizan/kak-rainbower"
bundle-install-hook kak-rainbower %{
    gcc ${kak_opt_bundle_path}/kak-rainbower/rc/rainbower.cpp -O2 -o ${kak_opt_bundle_path}/kak-rainbower/rc/rainbower
}

bundle "https://github.com/phaazon/kak-tree-sitter"
bundle-install-hook kak-tree-sitter %{
    cargo install --locked --path kak-tree-sitter --root ${HOME}/.local
    cargo install --locked --path ktsctl --root ${HOME}/.local
}

bundle  "https://github.com/andreyorst/smarttab.kak"

bundle  "https://github.com/enricozb/tabs.kak"
bundle-install-hook tabs.kak %{
    cargo install --locked --path . --root ${HOME}/.local
}

bundle "https://github.com/kak-lsp/kak-lsp"
bundle-install-hook kak-lsp %{
    cargo install --locked --path . --root ${HOME}/.local
    # optional: if you want to use specific language servers
    mkdir -p ~/.config/kak-lsp
    cp -n kak-lsp.toml ~/.config/kak-lsp/
}

bundle "https://github.com/occivink/kakoune-vertical-selection"
bundle "https://github.com/Delapouite/kakoune-text-objects"

bundle-load
