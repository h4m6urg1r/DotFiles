{ ... }: {
	programs.nixvim.plugins = {
		oil = {
			enable = true;
			# deleteToTrash = true;
			# trashCommand = ;
			# keymaps = ;
			# useDefaultKeymaps = true;
			columns = {
				icon.enable = true;
				# permissions.enable = true;
				# size.enable = true;
			};
		};
	};
}
