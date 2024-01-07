{ ... }: {
  services.logind = {
    powerKey = "ignore";
    powerKeyLongPress = "ignore";
    suspendKey = "ignore";
    suspendKeyLongPress = "ignore";
    hibernateKey = "ignore";
    hibernateKeyLongPress = "ignore";
  };
}
