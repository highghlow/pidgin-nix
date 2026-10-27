{
  lib,
  newScope,
  pidgin,
  texliveBasic,
  config,
}:

lib.makeScope newScope (
  self:
  let
    callPackage = self.callPackage;
  in
  {
    pidgin = callPackage ../. {
      withOpenssl = config.pidgin.openssl or true;
      withGnutls = config.pidgin.gnutls or false;
      plugins = [ ];
    };

    pidginPackages = self;

    pidgin-latex = callPackage ./pidgin-latex {
      texLive = texliveBasic;
    };

    pidgin-carbons = callPackage ./carbons { };

    pidgin-xmpp-receipts = callPackage ./pidgin-xmpp-receipts { };

    pidgin-otr = callPackage ./otr { };

    pidgin-osd = callPackage ./pidgin-osd { };

    pidgin-sipe = callPackage ./sipe { };

    pidgin-window-merge = callPackage ./window-merge { };

    purple-discord = callPackage ./purple-discord { };

    purple-googlechat = callPackage ./purple-googlechat { };

    purple-lurch = callPackage ./purple-lurch { };

    purple-mm-sms = callPackage ./purple-mm-sms { };

    purple-plugin-pack = callPackage ./purple-plugin-pack { };

    purple-slack = callPackage ./purple-slack { };

    purple-vk-plugin = callPackage ./purple-vk-plugin { };

    purple-xmpp-http-upload = callPackage ./purple-xmpp-http-upload { };

    tdlib-purple = callPackage ./tdlib-purple { };

    pidgin-opensteamworks = callPackage ./pidgin-opensteamworks { };

    purple-facebook = callPackage ./purple-facebook { };
  }
  // lib.optionalAttrs config.allowAliases {
    pidgin-indicator = throw "'pidginPackages.pidgin-indicator' has been removed as it depended on libappindicator-gtk2, which was removed for depending on the deprecated GTK 2 engine."; # Added 2026-08-10
    purple-matrix = throw "'pidginPackages.purple-matrix' has been unmaintained since April 2022, so it was removed.";
  }
)
