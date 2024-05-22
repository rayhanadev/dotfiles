{ pkgs, ... }:

{
  system = {
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      # menuExtraClock.Show24Hour = true;

      dock = {
        autohide = true;
        show-recents = false;

        wvous-tl-corner = 13;
        wvous-tr-corner = 3;
        wvous-bl-corner = 2;
        wvous-br-corner = 4;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        # TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = true;
        "com.apple.sound.beep.feedback" = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = true;

        InitialKeyRepeat = 15;
        KeyRepeat = 3;

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      CustomUserPreferences = {
        ".GlobalPreferences" = {
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = false;
          ShowHadDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemoveableMediaOnDeskop = false;
          _FXSortFoldersFirst = true;
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0;
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0;
          StandardHideDesktopIcons = 0;
          HideDesktop = 0;
          StageManagerHideWidgets = 0;
          StandardHideWidgets = 0;
        };
        "com.apple.screensaver" = {
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Downloads";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.ImageCapture".disableHotPlug = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # time.timeZone = "America/chicago";

  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      material-design-icons
      font-awesome

      (nerdfonts.override {
        fonts = [
          # "NerdFontsSymbolsOnly"
          "FiraCode"
          "JetBrainsMono"
          "VictorMono"
        ];
      })
    ];
  };
}
