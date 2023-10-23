{ ... }: {
	programs.wezterm.extraConfig = ''
local wezterm = require "wezterm"
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
${import ./background.nix}
${import ./colorScheme.nix}
${import ./font.nix}
${import ./miscellaneous.nix}
${import ./ui.nix}
return config'';
}
