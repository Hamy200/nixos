{config, inputs, ...}:
{

  hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        amdvlk
      ];
  
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
      
  };

  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
}
