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
  sqlite
}:

stdenv.mkDerivation rec {
  pname = "seagull";
  version = "0.8.2";

  src = fetchurl {
    url = "https://fastly.imfreedom.org/seagull/${version}/seagull-${version}.tar.xz";
    sha256 = "sha256-rWdiNgg4WLOtq2HsqDa09JuEdQmhtMRia0BOUDTjpu4=";
  };

  nativeBuildInputs = [
    meson
    gettext
    pkg-config
    cmake
    glib
    sqlite
    gi-docgen
    gobject-introspection
    ninja
  ];

  enableParallelBuilding = true;

  meta = {
    description = "A SQLite helper library";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
