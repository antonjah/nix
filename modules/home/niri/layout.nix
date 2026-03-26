{ ... }:
{
  programs.niri.settings.layout = {
    gaps = 16;
    center-focused-column = "never";
    preset-column-widths = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
    ];
    default-column-width = {
      proportion = 0.5;
    };

    focus-ring = {
      width = 1;
      active.color = "#8bd5ca";
      inactive.color = "#b4befe";
    };

    shadow = {
      enable = true;
      softness = 30;
      spread = 1;
      offset = {
        x = 0;
        y = 5;
      };
      color = "#0007";
    };
  };
}
