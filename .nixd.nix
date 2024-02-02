{
    
    formatting.command = "nixpkgs-fmt";
    options= {
        enable= true;
        target= {
            args= [ ];
            # installable= "/flakeref#nixosConfigurations.toaster.options";
            installable= "/flakeref#homeConfigurations.hamburgir.options";
        };
    };
}
