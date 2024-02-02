{ config, pkgs, ... }: {
	environment.etc."nextcloud-admin-pass".text = "test123";
	services.nextcloud = {
		enable = true;
		package = pkgs.nextcloud27;
		hostName = "nextcloud.tld";
		config = {
			adminuser = "shantnu";
			adminpassFile = "/etc/nextcloud-admin-pass";
			extraTrustedDomains = [ "192.168.0.110" "192.168.42.68" "127.0.0.1" ];
		};
		extraApps = with config.services.nextcloud.package.packages.apps; {
			inherit news contacts calendar tasks;
		};
		extraAppsEnable = true;
	};
	services.nginx.virtualHosts."nextcloud.tld".listen = [
		# {
		# 	addr = "192.168.0.110";
		# 	port = 8080;
		# }
		# {
		# 	addr = "127.0.0.1";
		# 	port = 8080;
		# }
		{
			addr = "192.168.42.68";
			port = 8080;
		}
	];
}
