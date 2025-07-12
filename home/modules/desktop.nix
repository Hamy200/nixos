{config, inputs, ...}:
{
  xdg.desktopEntries = {
    marktext = {
      name = "MarkText";
      exec = "marktext --enable-wayland-ime --wayland-text-input-version=3";
      terminal = false;
      categories = ["Application"];
      mimeType = ["text/markdown"];
    };
  };
}
