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

    pidgin-indicator = callPackage ./pidgin-indicator { };

    pidgin-latex = callPackage ./pidgin-latex {
      texLive = texliveBasic;
    };

    pidgin-carbons = callPackage ./carbons { };

    pidgin-xmpp-receipts = callPackage ./pidgin-xmpp-receipts { };

    pidgin-libnotify = callPackage ./pidgin-libnotify { };

    pidgin-libnotify-plus = callPackage ./pidgin-libnotify-plus { };

    pidgin-otr = callPackage ./otr { };

    pidgin-osd = callPackage ./pidgin-osd { };

    pidgin-sipe = callPackage ./sipe { };

    pidgin-window-merge = callPackage ./window-merge { };

    purple-discord = callPackage ./purple-discord { };

    purple-events = callPackage ./purple-events { };

    purple-googlechat = callPackage ./purple-googlechat { };

    purple-lurch = callPackage ./purple-lurch { };

    purple-matrix = callPackage ./purple-matrix { };

    purple-mm-sms = callPackage ./purple-mm-sms { };

    purple-plugin-pack = callPackage ./purple-plugin-pack { };

    purple-presage = callPackage ./purple-presage { };

    purple-slack = callPackage ./purple-slack { };

    purple-vk-plugin = callPackage ./purple-vk-plugin { };

    purple-xmpp-http-upload = callPackage ./purple-xmpp-http-upload { };

    tdlib-purple = callPackage ./tdlib-purple { };

    pidgin-opensteamworks = callPackage ./pidgin-opensteamworks { };

    purple-facebook = callPackage ./purple-facebook { };
  }
)
