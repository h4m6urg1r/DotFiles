{ pkgs, ... }: with pkgs.lib; let
recursiveMerge = attrList:
    let f = attrPath:
        zipAttrsWith (n: values:
        if tail values == []
            then head values
        else if all isList values
            then unique (concatLists values)
        else if all isAttrs values
            then f (attrPath ++ [n]) values
        else last values
        );
    in f [] attrList;
in let
        stolen = import ./dunst/dunstrc_end-4_dots-hyprland.nix;
        custom = import ./dunst/dunstrc.nix;
        theme = import ./dunst/catppuccinMocha.nix;
        mergedConf = recursiveMerge [ stolen custom theme ];
in {
    services = {
        dunst = {
            enable = true;
            iconTheme = {
                name = "Papirus-Dark";
                package = pkgs.papirus-icon-theme;
            };
            settings = mergedConf;
            # settings = {
            #     global = {
            #         width = 300;
            #         height = 300;
            #         offset = "30x50";
            #         origin = "top-right";
            #         transparency = 10;
            #         frame_color = "#eceff1";
            #         # font = 
            #     };
            #     urgency_normal = {
            #         background = "#37474f";
            #         foreground = "#eceff1";
            #         timeout = 30;
            #     };
            # };
        };
    };
}
