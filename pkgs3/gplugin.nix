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
  gi-docgen,
  pango,
  ninja,
  help2man,
  lua54Packages,
  python314Packages,
  python314,
  vala,

  pythonSupport ? false
}:

stdenv.mkDerivation rec {
  pname = "gplugin";
  version = "0.44.2";

  src = fetchurl {
    url = "https://fastly.imfreedom.org/gplugin/${version}/gplugin-${version}.tar.xz";
    sha256 = "sha256-rqJE4a3ZYotQ7AQsVM+TgD9Fd/jxQmePCbkf1MCyD3I=";
  };

  patches = [
    ./disable-python-check.patch
  ];

  nativeBuildInputs = [
    meson
    gettext
    pkg-config
    cmake
    gi-docgen
    glib
    gobject-introspection
    help2man
    ninja
    gtk4
    lua54Packages.lua
    lua54Packages.lgi
    vala
  ] ++ (lib.optional pythonSupport [
    python314Packages.pygobject3
    python314
  ]);

  enableParallelBuilding = true;

  mesonFlags = [
    (lib.mesonBool "python3" pythonSupport)
  ];

  meta = {
    description = "A GObject based library that implements a reusable plugin system";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
