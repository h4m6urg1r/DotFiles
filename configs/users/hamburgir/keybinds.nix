{ inputs, pkgs, ... }: {
    imports = [
        inputs.xremap.homeManagerModules.default
    ];
    home.packages = with pkgs; [
        inputs.xremap
    ];
    services.xremap = {
        withHypr = true;
        config = {
            keymap = [
                {
                    name = "Applications";
                    remap = {
                        super-o = {
                            remap = {
                                b = {
                                    launch = ["firefox"];
                                };
                                s = {
                                    launch = [ "pavucontrol" ];
                                };
                            };
                        };
                    };
                }
            ];
        };
    };
}
