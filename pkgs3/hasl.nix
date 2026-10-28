{
  stdenv,
  fetchurl,
  lib,
  meson,
  gettext,
  pkg-config,
  cmake,
  glib,
  gobject-introspection,
  gi-docgen,
  pango,
  ninja
}:

stdenv.mkDerivation rec {
  pname = "hasl";
  version = "0.6.0";

  src = fetchurl {
    url = "https://fastly.imfreedom.org/hasl/${version}/hasl-${version}.tar.xz";
    sha256 = "sha256-3YkuisXWG2QDHnWnAB7LiRa5m6Tvx4w8sSPNWaDDvLs=";
  };

  nativeBuildInputs = [
    meson
    gettext
    pkg-config
    cmake
    gi-docgen
    glib
    pango
    gobject-introspection
    ninja
  ];

  enableParallelBuilding = true;

  meta = {
    description = "The Hassle-free Authentication and Security Layer client library";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
