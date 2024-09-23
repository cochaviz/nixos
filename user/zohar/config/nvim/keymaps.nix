{
  programs.nixvim = {
    globals.mapleader = " ";
  
    keymaps = [
      {
        mode = ["i"];
        key = "jk";
        action = "<Esc>";
      }
      {
        mode = ["n" "t"];
        key = "<leader>'";
        action = "<cmd>ToggleTerm<cr>";
      }
      {
        mode = ["n"];
        key = "<leader>pb";
        action = "<cmd>b#<cr>";
      }
      {
        mode = ["n"];
        key = "<leader>pv";
        action = "<cmd>Ex<cr>";
      }
      {
        mode = ["n"];
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
      }
      {
	mode = ["n"];
	key = "<leader>nn";
	action = "<cmd>NoNeckPain<cr>";
      }
      {
	mode = ["n"];
	key = "<leader>nk";
	action = "<cmd>NoNeckPainWidthUp<cr>";
      }
      {
	mode = ["n"];
	key = "<leader>nj";
	action = "<cmd>NoNeckPainWidthDown<cr>";
      }
    ];
  };
}
