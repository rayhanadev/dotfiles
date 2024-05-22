{ pkgs, lib, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;

  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings = {
    auto-optimise-store = false;
  };
}
