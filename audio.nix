{ ... }:{
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    audio.enable = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;
    config.pipewire = {
      "context.properties" = {
         #"link.max-buffers" = 64;
         "link.max-buffers" = 16; # version < 3 clients can't handle more than this
         "log.level" = 2; # https://docs.pipewire.org/page_daemon.html
         #"default.clock.rate" = 48000;
         #"default.clock.quantum" = 1024;
         #"default.clock.min-quantum" = 32;
         #"default.clock.max-quantum" = 8192;
         #"core.daemon" = true;
         #"core.name" = "pipewire-0";
      };
    };

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    media-session.enable = false;
  
    media-session.config.bluez-monitor.rules = [
      {
        # Matches all cards
        matches = [ { "device.name" = "~bluez_card.*"; } ];
        actions = {
          "update-props" = {
            "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
            # mSBC is not expected to work on all headset + adapter combinations.
            "bluez5.msbc-support" = true;
            # SBC-XQ is not expected to work on all headset + adapter combinations.
            "bluez5.sbc-xq-support" = true;
          };
        };
      }
      {
        matches = [
          # Matches all sources
          { "node.name" = "~bluez_input.*"; }
          # Matches all outputs
          { "node.name" = "~bluez_output.*"; }
        ];
      }
    ];

  };
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };
}
