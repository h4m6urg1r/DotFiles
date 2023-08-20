{
    global = {
        monitor = 0;
        follow = "mouse";
        origin = "top-right";
        # offset = "20x73";
        # geometry = "280x50-20+200";
        width = 280;
        # height = 50;
        indicate_hidden = "no";
        shrink = "no";
        separator_height = 4;
        separator_color = "auto";
        padding = 20;
        horizontal_padding = 20;
        frame_width = 2;
        sort = "no";
        idle_threshold = 120;
        # font = "Torus 13";
        line_height = 4;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = "yes";
        ignore_newline = "no";
        stack_duplicates = "false";
        hide_duplicate_count = "yes";
        show_indicators = "no";
        icon_position = "left";
        # icon_path = "/home/end/.config/eww/images/linageOS Icons/1G.png";
        max_icon_size = 48;
        sticky_history = "no";
        history_length = 20;
        browser = "firefox";
        always_run_script = "true";
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
    };
    # shortcuts = {
    #     close = "ctrl+shift+space";
    #     close_all = "ctrl+shift+space";
    #     history = "ctrl+grave";
    #     context = "ctrl+shift+period";
    # };
    urgency_low = {
        timeout = 4;
        background = "#1A1B26";
        foreground = "#90D1F6";
        frame_color = "#AEE5FA";
    };
    urgency_normal = {
        timeout = 8;
        background = "#1A1B26";
        foreground = "#90D1F6";
        frame_color = "#AEE5FA";
    };
    urgency_critical = {
        timeout = 0;
        background = "#191919";
        foreground = "#EEAA00";
        frame_color = "#EEAA00";
    };
}
