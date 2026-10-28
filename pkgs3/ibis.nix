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
  ninja,

  birb,
  hasl
}:

stdenv.mkDerivation rec {
  pname = "ibis";
  version = "0.16.1";

  src = fetchurl {
    url = "https://fastly.imfreedom.org/ibis/${version}/ibis-${version}.tar.xz";
    sha256 = "sha256-zdLbSfms9gAXoIsHce3ORpPPcip672VgbRMksstTDg0=";
  };

  nativeBuildInputs = [
    meson
    gettext
    pkg-config
    cmake
    gi-docgen
    glib
    gobject-introspection
    ninja

    birb
    hasl
  ];

  enableParallelBuilding = true;

  meta = {
    description = "A GObject based IRCv3 library";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
