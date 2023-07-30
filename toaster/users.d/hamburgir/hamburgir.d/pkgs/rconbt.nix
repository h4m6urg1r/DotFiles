{ stdenv, expect, pkgs, ... }: 

stdenv.mkDerivation {
  name = "rconbt";
  buildInputs = [ expect ];
  src = pkgs.writeText "rconbt" ''
    #!/usr/bin/expect -f

    set prompt "#"
    set address "4C:72:74:84:03:8C"

    spawn sudo bluetoothctl -a
    expect -re $prompt
    send "remove $address\r"
    sleep 1
    expect -re $prompt
    send "scan on\r"
    send_user "\nSleeping\r"
    sleep 5
    send_user "\nDone sleeping\r"
    send "scan off\r"
    expect "Controller"
    send "trust $address\r"
    sleep 2
    send "pair $address\r"
    sleep 2
    send "0000\r"
    sleep 3
    send_user "\nShould be paired now.\r"
    send "quit\r"
    expect eof
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp $test $out/bin/$name
    chmod +x $out/bin/$name
  '';
}

