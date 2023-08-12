{ config, pkgs, ... }: let
    cfg = config.userdefined;
in {
    services.mysql.enable = false;
    services.mysql.package = pkgs.mariadb;
}
