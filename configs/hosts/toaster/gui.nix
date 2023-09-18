{ inputs, outputs, pkgs, lib, ... }:let
        package = {
          cfg,
          flavour,
          lib,
          pkgs,
          qtbase,
          qtsvg,
          qtgraphicaleffects,
          qtquickcontrols2,
          srcPath,
          wrapQtAppsHook,
          stdenv
        }: stdenv.mkDerivation rec {
          name = "Catppuccin-${flavour}";

          srcRepo = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "sddm";
            rev = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
            hash = "sha256-SjYwyUvvx/ageqVH5MmYmHNRKNvvnF3DYMJ/f2/L+Go=";
          };
          src = "${srcRepo}/src/${srcPath}";

          nativeBuildInputs = [
            wrapQtAppsHook
            pkgs.imagemagick
          ];
          buildInputs = [
            qtbase
            qtsvg
            qtgraphicaleffects
            qtquickcontrols2
          ];

          installPhase = ''
            mkdir -p $out/share/sddm/themes
            cp -aR $src $out/share/sddm/themes/${name}
            chmod +w -R $out
            if [[ ${if cfg.background == null then "false" else "true"} ]]; then
              convert ${cfg.background} $out/share/sddm/themes/${name}/backgrounds/wall.jpg
            fi
          '';
            postFixup = ''
              sed -i '/^Font=/s/.*/Font="${cfg.font}"/' $out/share/sddm/themes/${name}/theme.conf
              sed -i '/^FontSize=/s/.*/FontSize="${cfg.fontSize}"/' $out/share/sddm/themes/${name}/theme.conf
              sed -i '/^ClockEnabled=/s/.*/ClockEnabled="${cfg.clockEnabled}"/' $out/share/sddm/themes/${name}/theme.conf
              sed -i '/^CustomBackground=/s/.*/CustomBackground="${if cfg.background != null then cfg.customBackground else "false"}"/' $out/share/sddm/themes/${name}/theme.conf
              sed -i '/^LoginBackground=/s/.*/LoginBackground="${cfg.loginBackground}"/' $out/share/sddm/themes/${name}/theme.conf
            '';

          meta = {
            description = "Catppuccin ${flavour} sddm theme";
            license = lib.licenses.gpl3;
          };
        };
        catppuccin-sddm = pkgs.libsForQt5.callPackage package{
            cfg = {
                font = "Noto Sans";
                fontSize = "9";
                clockEnabled = "true";
                customBackground = "true";
                loginBackground = "true";
                background = builtins.fetchurl {
                  url = "https://raw.githubusercontent.com/uday-sudo/wallpapers/main/1506250.jpg";
                  sha256 = "1qifxf8ns22v442v93w61daw06jcx8wvpp4c0viida6hh6jzkjjg";
                };
            };
            flavour = "Mocha";
            srcPath = "catppuccin-mocha";
        };
in {
    # Enable the X11 windowing system.

    services.xserver.desktopManager = {
        xfce.enable = false;
        gnome.enable = false;
        plasma5.enable = false;
    };


    services.xserver.windowManager = {
        qtile.enable = false;
        i3.enable = true;
        herbstluftwm.enable = false;
        awesome = {
            enable = false;
            luaModules = with pkgs.luaPackages;[
                luarocks
                    luadbi-mysql
            ];
        };
    };

    programs.sway.enable = true;

    environment.systemPackages = [ 
        catppuccin-sddm
    ];
    services.xserver.displayManager = {
        gdm.enable = false;
        sddm = {
            enable = true;
            theme = "Catppuccin-Mocha";
        };
        lightdm.enable = false;
    };

    # Configure keymap in X11
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
    };
    services.gnome.gnome-keyring.enable = true;
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };
    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
}
