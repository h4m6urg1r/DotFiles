{ ... }: {
    hardware.uinput.enable = true;
    users.groups.uinput.members = [ "hamburgir" ];
    users.groups.input.members = [ "hamburgir" ];
}
