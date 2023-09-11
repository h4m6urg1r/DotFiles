{ config, pkgs, ... }: {
    programs.starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        settings = {
            add_newline = false;
            format = pkgs.lib.concatStrings [
                "[╭](black)" "$fill" "$nix_shell" "[╮](black)" "$line_break"
                # "│" "─"
                # "│" "─"
                "[╰](black)" "$os" "[\\[ $directory \\]](blue)" "[─](black)" "$character" # "╯"
            ];
            right_format = pkgs.lib.concatStrings [
                "$time" "$cmd_duration" "[╯](black)"
            ];
            # character = {
            #     success_symbol = "[➜](bold green) ";
            #     error_symbol = "[➜](bold red) ";
            # };
            cmd_duration = {
                format = "[ $duration]($style)";
                show_notifications = true;
                min_time_to_notify = 20000;
            };
            directory = {
                format = "[$path]($style)[$read_only]($read_only_style)";
                fish_style_pwd_dir_length = 1;
                home_symbol = "󰋜";
                read_only = " ";
                style = "dimmed";
            };
            fill = {
                symbol = "─";
                style = "black";
            };
            nix_shell = {
                format = "[$symbol$state( \\($name\\))]($style)";
                heuristic = true;
            };
            os = {
                disabled = true;
            };
            time = {
                format = "[$time]($style) ";
                style = "white";
                use_12hr = true;
                disabled = false;
            };
        };
    };
    programs.zsh = {
        # initExtraFirst = "zmodload zsh/zprof";
        initExtra = ''
            ZLE_RPROMPT_INDENT=0
            '';
        # initExtra = ''
        #     any-nix-shell zsh --info-right | source /dev/stdin
        # '';
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        enableVteIntegration = true;
        autocd = true;
        # defaultKeymap = "viins";
        dirHashes = {
            movs = "/run/media/${config.home.username}/4545627b-bf85-4556-8d34-239e9301f743/unseen";
            games = "/run/media/${config.home.username}/88a877a8-0f92-4cc2-b1e7-a121dde16fcb/files";
        };
        dotDir = ".config/zsh";
        history = {
            # expireDuplicatesFirst = true;
            extended = true;
            ignoreDups = true;
            ignorePatterns = [
                "bash"
                "clear"
                "killall *"
                "pkill *"
                "zsh"
            ];
            ignoreSpace = true;
            share = true;
        };
        historySubstringSearch = {
            enable = true;
        };
        oh-my-zsh = {
            enable = true;
            # extraConfig = ''
            #     zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
            # '';
            plugins = [
                "git"
                "sudo"
            ];
            # theme = "";
        };
        # plugins = [
        #     {
        #         name = "fast-syntax-highlighting";
        #         src = pkgs.fetchFromGitHub {
        #           owner = "zdharma-continuum";
        #           repo = "fast-syntax-highlighting";
        #           rev = "v1.55";
        #           hash = "sha256-DWVFBoICroKaKgByLmDEo4O+xo6eA8YO792g8t8R7kA=";
        #         };
        #     }
        # ];
    };
}
