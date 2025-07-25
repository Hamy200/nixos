{config, inputs, ...}:
{
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    
    envfs.enable = true;

    udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c32", TAG+="uaccess"
    '';
  };
}
