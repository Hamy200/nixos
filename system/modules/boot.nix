{config, lib, pkgs, inputs, ...}:
{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
      };

      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = ["amdgpu"];
      luks.devices = {
        crypt = {
          device = "/dev/disk/by-label/crypt-container";
          preLVM = true;
        };
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    
  };
  
}
