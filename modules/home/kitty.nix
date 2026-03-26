{ ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 13;
    themeFile = "tokyo_night_moon";
    settings = {
      cursor_trail = 2;
      enable_audio_bell = false;
      cursor_shape = "block";
      window_padding_width = 20;
      hide_window_decorations = true;
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title[title.rfind('/')+1:]}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
    shellIntegration.enableFishIntegration = true;
    shellIntegration.mode = "no-cursor";
  };
}
