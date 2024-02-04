{ ... }: {
    home.file."Awesome" = {
        source = ./hamburgir.d/awesome;
        target = ".config/awesome";
    };

    home.file."Qtile" = {
        source = ./hamburgir.d/qtile;
        target = ".config/qtile";
        onChange = "pkill -SIGUSR1 qtile";
    };

    home.file."Tmux" = {
        source = ./hamburgir.d/tmux.conf;
        target = ".tmux.conf";
    };

    home.file."Zellij" = {
        source = ./hamburgir.d/zellij;
        target = ".config/zellij";
    };

    # home.file."i3" = {
    #     source = ./hamburgir.d/i3;
    #     target = ".config/i3";
    # };

    #home.file."Eww" = {
    #    source = ./hamburgir.d/eww;
    #    target = ".config/eww";
    #};

    #home.file."Neovim" = {
    #    source = ./hamburgir.d/nvim;
    #    target = ".config/nvim";
    #};
}
