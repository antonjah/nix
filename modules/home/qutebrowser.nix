{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      window.hide_decoration = true;
      scrolling.smooth = true;
      colors.webpage.preferred_color_scheme = "dark";
      completion.open_categories = [
        "quickmarks"
        "bookmarks"
        "history"
        "searchengines"
      ];
      completion.quick = true;
    };
    keyBindings.normal = {
      "d" = "nop";
      "<Shift-D>" = "tab-close";
    };
    searchEngines = {
      DEFAULT = "https://www.google.com/search?q={}";
      nixpkgs = "https://search.nixos.org/packages?channel=unstable&query={}";
      hm = "https://home-manager-options.extranix.com/?query={}&release=master";
    };
    quickmarks = {
      "youtube" = "https://youtube.com";
      "nix" = "https://mynixos.com";
      "reddit" = "https://www.reddit.com/r/all";
    };
    extraConfig = ''
      c.tabs.padding = {'top': 5, 'bottom': 5, 'right': 0, 'left': 0}
    '';
  };
}
