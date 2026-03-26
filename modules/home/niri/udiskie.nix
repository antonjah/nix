{ ... }:
{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [
          "udiskie"
          "--no-tray"
        ];
      }
    ];
  };
}
