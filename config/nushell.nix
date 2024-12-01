{ config, pkgs, ... }:

{
  packages = with pkgs; [
    nushell
  ];
  programs = {
    nushell = {
      enable = true;
    };
  };
}
