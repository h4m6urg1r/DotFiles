{ ... }: {
    programs = {
        gh = {
            enable = true;
            gitCredentialHelper.enable = true;
            settings = {
                git_protocol = "ssh";
                editor = "nvim";
            };
        };
        git = {
            enable = true;
            userName = "Hamburgir";
            userEmail = "shantnuprofid@gmail.com";
            #delta.enable = true;
            diff-so-fancy.enable = true;
            ignores = [ "*.tmp" "*.temp" "tmp.*" "temp.*" ];
        };
        lazygit.enable = true;
    };
}
