{config, inputs, pkgs, ...}:
{
  users.groups.libvirtd.members = ["hc"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  
 # systemd.tmpfiles.rules = ["f /dev/shm/looking-glass 0660 hc qemu-libvirtd -"];
  
 # virtualisation = {
 #    libvirtd = {
 #      enable = true;
#
#       # Don't start any VMs automatically on boot.
#       onBoot = "ignore";
#       # Stop all running VMs on shutdown.
#       onShutdown = "shutdown";
#
#       qemu = {
#         package = pkgs.qemu_kvm;
#         ovmf.enable = false;
#       };
#    };
#  };
#
#  users.users.hc.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
 
}

