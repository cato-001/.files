{ pkgs, ... }:

{
  packages = with pkgs; [
    nushell
  ];
  program = {
    enable = true;
  };
}
