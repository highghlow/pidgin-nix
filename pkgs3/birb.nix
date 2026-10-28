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
  pname = "birb";
  version = "0.11.0";

  src = fetchurl {
    url = "https://fastly.imfreedom.org/birb/0.11.0/birb-0.11.0.tar.xz";
    sha256 = "sha256-k2buZdSg4o2mCVWsw2GPY2cujz8iKSlvivFNZFnKN0E=";
  };

  propagatedBuildInputs = [
    pango
  ];

  nativeBuildInputs = [
    meson
    gettext
    pkg-config
    cmake
    gi-docgen
    glib
    gobject-introspection
    ninja
  ];

  enableParallelBuilding = true;

  meta = {
    description = "A library of utilities for GLib based applications";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
