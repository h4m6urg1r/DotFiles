{ ... }: {
	programs.nixvim.keymaps = let
		vimCmd = (cmd: "<CMD>${cmd}<CR>");
		lldr = (key: "<LocalLeader>${key}");
		ldr = (key: "<Leader>${key}");
		fgrp = (key: ldf "f${key}");
		bgrp = (key: ldf "b${key}");
	in [
		{
			action = "<Nop>";
			key = "<space>";
			mode = [ "n" ];
			options = {
				silent = true;
			};
		}
		{
			action = "require('telescope.builtin').grep_string";
			lua = true;
			key = fgrp "G";
			mode = [ "n" "v" ];
			options = {
				desc = "Grep string under cursor in pwd";
                silent = true;
			};
		}
		{
			action = "";
		}
	];
	programs.nixvim.plugins.which-key = {
		enable = true;
		layout = {
			align = "center";
		};
	};
}
