{ pkgs, ... }: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraPython3Packages = pyPkgs: with pyPkgs; [
            python-lsp-server
        ];
        # extraLuaPackages = luaPkgs: with luaPkgs; [
        #     lua-lsp
        # ];
        extraPackages = with pkgs; [
            lua-language-server
        ];
    };
}
