{ ... }: {
    programs = {
        gh = {
            enable = true;
            enableGitCredentialHelper = true;
            settings = {
                git_protocol = "ssh";
                editor = "nvim";
            };
        };
        git = {
            enable = true;
            userName = "the-noob-coder69";
            userEmail = "shantnuprofid@gmail.com";
            #delta.enable = true;
            diff-so-fancy.enable = true;
            ignores = [ "*.tmp" "*.temp" "tmp.*" "temp.*" ];
        };
    };
}
