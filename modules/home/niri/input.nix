{ ... }:
{
  programs.niri.settings.input = {
    keyboard = {
      xkb = {
        layout = "se";
      };
      numlock = true;
      repeat-delay = 300;
      repeat-rate = 50;
    };
    mouse = {
      accel-profile = "flat";
    };
  };
}
