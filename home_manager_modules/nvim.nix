{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    #lsp servers
    texlab
    lua-language-server
    pyright
    nil
    marksman
    
    luarocks
    fzf
  ];


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Install plugins
    plugins = with pkgs.vimPlugins; [
      nvim-notify
      noice-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      kanagawa-nvim
      telescope-nvim
      (nvim-treesitter.withPlugins (plugins: with plugins; [
        tree-sitter-bash
        tree-sitter-c
        tree-sitter-cpp
        tree-sitter-css
        tree-sitter-dockerfile
        tree-sitter-go
        tree-sitter-html
        tree-sitter-javascript
        tree-sitter-json
        tree-sitter-lua
        tree-sitter-markdown
        tree-sitter-nix
        tree-sitter-python
        tree-sitter-rust
        tree-sitter-yaml
        tree-sitter-sql
      ]))

      vimwiki
    ];

  };
  
  xdg.configFile."nvim" = {
    source = ../config/nvim;
    recursive = true;
  };

}
