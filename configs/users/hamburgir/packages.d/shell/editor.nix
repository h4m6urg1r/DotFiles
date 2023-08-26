{ pkgs, ... }: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withPython3 = true;
        # extraPython3Packages = pyPkgs: with pyPkgs; [
        #     python-lsp-server
        # ];
        # extraLuaPackages = luaPkgs: with luaPkgs; [
        #     lua-lsp
        # ];
        extraPackages = with pkgs; [
            fd
            gcc
            lua-language-server
            ripgrep
            pkgs.python311Packages.python-lsp-server
            pkgs.python311Packages.pyls-isort
        ];
    };
}
