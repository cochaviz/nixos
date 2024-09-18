{ pkgs, ... }:

{
  imports = [
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    colorschemes.everforest.enable = true;
    clipboard.register = "unnamedplus";

    opts = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };

    extraPlugins = with pkgs.vimPlugins; [
       no-neck-pain-nvim
    ];

    plugins = {
      treesitter.enable = true;
      nvim-autopairs.enable = true;
      neo-tree.enable = true;
      gitsigns.enable = true;

      toggleterm = {
        enable = true;
        settings.open_mapping = "[[<leader>']]";
      };

      telescope = {
	enable = true;
	keymaps = {
	  "<leader>fs" = { action = "live_grep"; };
	  "<leader>ff" = { action = "find_files"; };
	  "<leader>fb" = { action = "buffers"; };
	  # "<leader>pg" = { action = "git_files"; };
	};
	extensions = {
	  fzf-native.enable = true;
	};
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

	filetype = {
	  markdown.sources = [
	    { name = "nvim_lsp"; }
	  ];
	};

        settings = {
          experimental = { ghost_text = true; };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable = true; # nix
          pylsp.enable = true; # python
	  cssls.enable = true;
	  html.enable = true;
	  marksman.enable = true; # markdown
	  typos-lsp.enable = true; # spell checker
        };
	keymaps.lspBuf = {
	  K = "hover";
	  gD = "references";
	  gd = "definition";
	  gi = "implementation";
	  gt = "type_definition";
	  gR = "rename";

	  "<C-.>".action = "code_action";
	};
      };
    };

    # necessary for telescope
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  }; 
}
