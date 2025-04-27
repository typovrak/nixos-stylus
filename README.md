# nixos-stylus

nixos-stylus = fetchGit {
	url = "https://github.com/typovrak/nixos-stylus.git";
	ref = "main";
};

(import "${nixos-stylus}/configuration.nix")
