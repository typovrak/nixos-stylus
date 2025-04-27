{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.stylus = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/stylus
		mkdir ${home}/.config/stylus
		chown ${username}:${group} ${home}/.config/stylus
		chmod 700 ${home}/.config/stylus

		cp ${./catppuccin-mocha-green.json} ${home}/.config/stylus/catppuccin-mocha-green.json
		chown ${username}:${group} ${home}/.config/stylus/catppuccin-mocha-green.json
		chmod 600 ${home}/.config/stylus/catppuccin-mocha-green.json
	'';

	environment.systemPackages = with pkgs; [
		chromium
	];
}
