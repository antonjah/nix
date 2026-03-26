{ ... }:
{
  programs.dank-material-shell = {
    enable = true;

    # Niri integration
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
      includes.enable = false;
    };

    settings = {
      matugenScheme = "scheme-tonal-spot";
      runUserMatugenTemplates = true;

      # Transparency
      popupTransparency = 1.0;
      dockTransparency = 1.0;

      # Widget
      widgetBackgroundColor = "sch";
      widgetColorMode = "default";
      cornerRadius = 12;

      # Clock
      use24HourClock = true;
      showSeconds = true;
      useFahrenheit = false;
      clockCompactMode = false;
      clockDateFormat = "";

      # Night mode
      nightModeEnabled = false;
      animationSpeed = 3;
      customAnimationDuration = 500;

      # Wallpaper display settings (not the actual wallpaper path)
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;

      # Bar widgets
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      showSystemTray = true;
      showClock = true;
      showNotificationButton = true;
      showBattery = false;
      showControlCenterButton = true;
      showCapsLockIndicator = true;

      # Control Center
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowAudioPercent = false;
      controlCenterShowVpnIcon = false;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowBrightnessPercent = false;
      controlCenterShowMicIcon = false;
      controlCenterShowMicPercent = false;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;

      # Privacy
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;

      # Control Center Widgets
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];

      # Workspace
      showWorkspaceIndex = false;
      showWorkspacePadding = true;
      workspaceScrolling = false;
      showWorkspaceApps = false;
      maxWorkspaceIcons = 3;
      workspacesPerMonitor = true;
      showOccupiedWorkspacesOnly = true;
      reverseScrolling = false;

      # Media
      waveProgressEnabled = true;
      scrollTitleEnabled = true;
      audioVisualizerEnabled = true;
      audioScrollEnabled = true;
      mediaSize = 1;

      # Running
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      runningAppsCurrentWorkspace = false;
      runningAppsGroupByApp = false;

      # Centering
      centeringMode = "index";

      # Launcher
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      sortAppsAlphabetically = false;
      appLauncherGridColumns = 5;
      spotlightCloseNiriOverview = true;
      niriOverviewOverlayEnabled = true;

      # Weather
      useAutoLocation = false;
      weatherEnabled = true;

      # Network
      networkPreference = "wifi";

      # Icon
      iconTheme = "System Default";

      # Fonts
      fontWeight = 700;
      fontScale = 1.0;

      # Notepad
      notepadUseMonospace = true;
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;

      # Sounds
      soundsEnabled = false;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;

      # Power
      lockBeforeSuspend = false;
      loginctlLockIntegration = true;
      fadeToLockEnabled = false;
      fadeToLockGracePeriod = 5;

      # Theme integration
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = true;
      terminalsAlwaysDark = false;

      # Matugen
      runDmsMatugenTemplates = true;
      matugenTemplateGtk = true;
      matugenTemplateNiri = true;
      matugenTemplateQt5ct = true;
      matugenTemplateQt6ct = true;
      matugenTemplateFirefox = true;
      matugenTemplatePywalfox = true;
      matugenTemplateZenBrowser = true;
      matugenTemplateVesktop = true;
      matugenTemplateEquibop = true;
      matugenTemplateGhostty = true;
      matugenTemplateKitty = true;
      matugenTemplateFoot = true;
      matugenTemplateAlacritty = true;
      matugenTemplateNeovim = true;
      matugenTemplateWezterm = true;
      matugenTemplateDgop = true;
      matugenTemplateKcolorscheme = true;
      matugenTemplateVscode = true;

      # Dock
      showDock = false;
      dockAutoHide = false;
      dockGroupByApp = false;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 0;
      dockIconSize = 40;
      dockIndicatorStyle = "line";
      dockBorderEnabled = false;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 1.0;
      dockBorderThickness = 1;
      dockIsolateDisplays = false;

      # Notifications
      notificationOverlayEnabled = false;
      modalDarkenBackground = true;

      # Lock Screen
      lockScreenShowPowerActions = true;
      lockScreenShowSystemIcons = true;
      lockScreenShowTime = true;
      lockScreenShowDate = true;
      lockScreenShowProfileImage = true;
      lockScreenShowPasswordField = true;
      enableFprint = false;
      maxFprintTries = 3;
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";

      # OSD
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationPopupPosition = 0;
      osdAlwaysShowValue = false;
      osdPosition = 5;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;

      # Power
      powerActionConfirm = false;
      powerActionHoldDuration = 1;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;

      # Display
      displayNameMode = "system";
      showOnLastDisplay = {
        dankBar = true;
      };

      # Bar
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0; # top
          screenPreferences = [ "all" ];
          showOnLastDisplay = true;

          leftWidgets = [
            "launcherButton"
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
          ];

          centerWidgets = [
            "music"
            "clock"
            {
              id = "weather";
              enabled = true;
            }
          ];

          rightWidgets = [
            {
              id = "memUsage";
              enabled = true;
            }
            {
              id = "cpuUsage";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
              showNetworkIcon = true;
              showBluetoothIcon = false;
              showAudioIcon = false;
              showVpnIcon = false;
              showBrightnessIcon = false;
              showMicIcon = false;
              showBatteryIcon = false;
              showPrinterIcon = false;
            }
            {
              id = "systemTray";
              enabled = true;
            }
          ];

          spacing = 0;
          innerPadding = -8;
          bottomGap = 0;
          transparency = 0.8;
          widgetTransparency = 0.5;
          squareCorners = true;
          noBackground = false;
          gothCornersEnabled = true;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "primary";
          borderOpacity = 1.0;
          borderThickness = 1;
          fontScale = 1.0;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = false;
          popupGapsManual = 4;
        }
      ];

      # Desktop Widgets
      desktopClockEnabled = false;
      systemMonitorEnabled = false;
    };

    # Session configuration
    session = {
      # Theme mode
      isLightMode = false;
      doNotDisturb = false;

      # Wallpaper settings
      perMonitorWallpaper = false;
      monitorWallpapers = { };
      perModeWallpaper = false;
      wallpaperPathLight = "";
      wallpaperPathDark = "";
      monitorWallpapersLight = { };
      monitorWallpapersDark = { };
      wallpaperTransition = "fade";
      includedTransitions = [
        "fade"
        "wipe"
        "disc"
        "stripes"
        "iris bloom"
        "pixelate"
        "portal"
      ];

      # Wallpaper cycling
      wallpaperCyclingEnabled = false;
      wallpaperCyclingMode = "interval";
      wallpaperCyclingInterval = 300;
      wallpaperCyclingTime = "06:00";
      monitorCyclingSettings = { };

      # Night mode
      nightModeEnabled = true;
      nightModeTemperature = 4500;
      nightModeHighTemperature = 6500;
      nightModeAutoEnabled = true;
      nightModeAutoMode = "location";
      nightModeStartHour = 18;
      nightModeStartMinute = 0;
      nightModeEndHour = 6;
      nightModeEndMinute = 0;
      latitude = 64.7502;
      longitude = 20.9509;
      nightModeUseIPLocation = false;
      nightModeLocationProvider = "";

      # Weather
      weatherLocation = "Skellefteå, Västerbottens län";
      weatherCoordinates = "64.7520185,20.9593390";

      # Apps and UI
      pinnedApps = [ ];
      hiddenTrayIds = [
      ];
      recentColors = [ ];
      showThirdPartyPlugins = true;
      enabledPlugins = [
      ];
      launchPrefix = "";

      # Hardware settings
      lastBrightnessDevice = "";
      brightnessExponentialDevices = { };
      brightnessUserSetValues = { };
      brightnessExponentValues = { };
      selectedGpuIndex = 0;
      nvidiaGpuTempEnabled = false;
      nonNvidiaGpuTempEnabled = false;
      enabledGpuPciIds = [ ];
      wifiDeviceOverride = "";

      # Weather details
      weatherHourlyDetailed = true;

      # Config version
      configVersion = 2;
    };
  };
}
