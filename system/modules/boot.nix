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
	extraEntries = ''
	  menuentry "Arch" {
	    load_video
	    set gfxpayload=keep
	    insmod gzio
	    insmod part_gpt
	    insmod fat
 	    search --no-floppy --fs-uuid --set=root 1CF6-1E10
	    echo "Loading Linux linux"
 	    linux	/vmzlinuz-linux root=UUIDe31454f4-f5b6-4be1-82c3-7f8fd9e3cecd rw cryptdevice=UUID=6b53492d-3b8d-44a2-9be1-19a87588a580:root zswap.enabled=0 rootfstype=ext4 logleve=3 quiet
     	    initrd	/amd-ucode.img /initramfs-linux.img
	  }
 	  menuentry "ArchTest" {
	    set root=(hd1,7)
	    set prefix=(hd1,7)/grub
	    insmod normal
	    normal	
	  }
	'';
      };

      efi.canTouchEfiVariables = true;
    };

    initrd = {
      kernelModules = ["vfio_pci" "vfio" "vfio_iommu_type1" ];
      #availableKernelModules = [
      #   "amdgpu" "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"
      #];
      luks.devices = {
        crypt = {
          device = "/dev/disk/by-label/crypt-container";
          preLVM = true;
        };
      };
    };
    
    #kernelModules = ["amdgpu"];
    extraModulePackages = [];

    kernelParams = [
      "amd_iommu=on"
      "vfio-pci.ids=1002:744c,1002:ab30"
    ];
    
    kernelPackages = pkgs.linuxPackages_latest;
    
    supportedFilesystems = ["ntfs"]; 
  };

  fileSystems."/media/Hamza HDD" = {
    device = "/dev/sda1";
    fsType = "ntfs-3g";
    options = [
      "nofail"
    ];
  };
  hardware.firmware = [pkgs.linux-firmware];
  
}
