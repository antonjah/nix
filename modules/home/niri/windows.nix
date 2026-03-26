{ ... }:
{
  programs.niri.settings.window-rules = [
    {
      clip-to-geometry = true;
      geometry-corner-radius = {
        top-left = 12.0;
        top-right = 12.0;
        bottom-left = 12.0;
        bottom-right = 12.0;
      };
    }
    {
      matches = [
        {
          app-id = "steam";
          title = "^notificationtoasts_\\d+_desktop$";
        }
      ];
      default-floating-position = {
        x = 10;
        y = 10;
        relative-to = "bottom-right";
      };
    }
    {
      matches = [
        {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        }
        {
          title = "^Open$";
        }
      ];
      open-floating = true;
    }
    {
      matches = [
        {
          app-id = "^org.qutebrowser.qutebrowser$";
        }
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "code$";
        }
        {
          app-id = "dev.zed.Zed-Nightly$";
        }
        {
          app-id = "goland$";
        }
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "^dev.zed.Zed-Nightly$";
          title = "^Zed — ";
        }
      ];
      open-floating = true;
    }
    {
      matches = [
        {
          app-id = "firefox$";
        }
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "^spotify$";
        }
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "^org.quickshell$";
        }
      ];
      open-floating = true;
    }
    {
      matches = [
        {
          app-id = "^kitty-hms$";
        }
      ];
      open-floating = true;
      default-column-width = {
        proportion = 0.5;
      };
      default-window-height = {
        proportion = 0.7;
      };
    }
  ];
}
