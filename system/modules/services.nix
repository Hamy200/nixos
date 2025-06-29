{config, inputs, ...}:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  }; 

}
