{
  stdenv,
  fetchhg,
  lib,
  meson,
  gettext,
  pkg-config,
  cmake,
  glib,
  gobject-introspection,
  gi-docgen,
  ninja,
 
  birb
}:

stdenv.mkDerivation rec {
  pname = "xeme";
  version = "9e89897451b4";

  src = fetchhg {
    url = "https://keep.imfreedom.org/xeme/xeme";
    rev = version;
    hash = "sha256-RJ6vH5RYdzRzE+pyHGrZUguYSLZtUIuTbr4TTXNKOAk=";
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
  ];

  enableParallelBuilding = true;

  meta = {
    description = "A high level XMPP parsing library based on GObjects";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl2;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
