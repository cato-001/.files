{ pkgs, ... }:

{
  enable = true;
  configFile.source = ./config/nushell/config.nu
}
