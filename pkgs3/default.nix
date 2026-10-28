{
  stdenv,
  fetchurl,
  lib,
  meson,
  gettext,
  pkg-config,
  cmake,
  glib,
  gtk4,
  gobject-introspection,
  libadwaita,
  gtksourceview5,
  libspelling,
  gst_all_1,
  json-glib,
  libsoup_3,
  libsecret,
  qrencode,
  ninja,
  wrapGAppsHook4,

  birb,
  seagull,
  gplugin,
  hasl,
  xeme,
  ibis
}:

let
  unwrapped = stdenv.mkDerivation rec {
    pname = "pidgin";
    version = "2.97.0";

    # TODO: switch to mirror://sourceforge
    src = fetchurl {
      url = "https://master.dl.sourceforge.net/project/pidgin/Pidgin3/${version}/pidgin3-${version}.tar.xz";
      sha256 = "sha256-SfyjmOrRctMb/k76zYWmsDkWsyEhBNKxzAR2VNaebR4=";
    };

    buildInputs = [
      glib
      gtk4
      gobject-introspection
      libadwaita
      gtksourceview5
      libspelling
      json-glib
      libsoup_3
      libsecret
      gplugin
      qrencode
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base

      birb
      seagull
      gplugin
      hasl
      xeme
      ibis
    ];

    nativeBuildInputs = [
      meson
      gettext
      pkg-config
      cmake
      ninja

      wrapGAppsHook4
    ];

    enableParallelBuilding = true;
    dontStrip = true;

    meta = {
      description = "Multi-protocol instant messaging client";
      mainProgram = "pidgin3";
      homepage = "https://pidgin.im/";
      license = lib.licenses.gpl2Plus;
      platforms = lib.platforms.unix;
      maintainers = [ ];
    };
  };

in
unwrapped
