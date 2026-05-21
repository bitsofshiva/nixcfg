# PC Home Shiva

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  ...
}:
{
  imports = [
    ../dp06/shiva.nix
  ];

  users.users.user = {
    openssh.authorizedKeys.keys = [
      # Shiva Laptop public key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArlTbzSLIYPvhCAIJDDIHt0fWKgjWRxlHMkV9269OKL user@dp06"
    ];
  };
  services.xserver.enable=true;
  services.xserver.videoDrivers=["nvidia"];
  hardware.nvidia={
    modesetting.enable=true;
    open=false;
    nvidiaSettings=true;
  };
  hardware.opengl.enable=true;

  hokage = {
    hostName = "dp10";
    zfs.hostId = "e8fd4331";
    gaming.enable = true;
    nixbit.repository = "https://github.com/bitsofshiva/nixcfg.git";
  };
}
