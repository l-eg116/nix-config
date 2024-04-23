{ pkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  # environment.systemPackages = with pkgs; [
  #   firefox
  # ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;

        ExtensionSettings = {
          # ArcWTF dependencies
          # Sidebery
          "{3c078156-979c-498b-8990-85f7987dd929}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
              installation_mode = "force_installed";
          };
          # Userchrome toggle
          "userchrome-toggle@joolee.nl" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/userchrome-toggle/latest.xpi";
              installation_mode = "force_installed";
          };
          # FireFox Colors
          "FirefoxColor@mozilla.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
              installation_mode = "force_installed";
          };

          # uBlock Origin
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # Dark Reader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "uc.tweak.popup-search" = true;
        "uc.tweak.longer-sidebar" = true;
        "browser.startup.page" = 3;
        "browser.ctrlTab.sortByRecentlyUsed" = true;

        "widget.use-xdg-desktop-portal.file-picker" = true;
        "browser.download.useDownloadDir" = false;
      };
    };
  };

  home.file."firefox_chrome" = {
    source = ./arcwtf;
    target = ".mozilla/firefox/default/chrome";
    recursive = true;
  };
}