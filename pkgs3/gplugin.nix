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
  gi-docgen,
  ninja,
  help2man,

  luaSupport ? true,
  lua54Packages,

  pythonSupport ? false, # Crashed pidgin for some reason
  python314Packages,
  python314,

  valaSupport ? true,
  vala,
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
  ] ++ (lib.optional luaSupport [
    lua54Packages.lua
    lua54Packages.lgi
  ]) ++ (lib.optional pythonSupport [
    python314Packages.pygobject3
    python314
  ]) ++ (lib.optional valaSupport [
    vala
  ]);

  enableParallelBuilding = true;

  mesonFlags = [
    (lib.mesonBool "python3" pythonSupport)
    (lib.mesonBool "lua" luaSupport)
    (lib.mesonBool "vapi" valaSupport)
  ];

  meta = {
    description = "A GObject based library that implements a reusable plugin system";
    homepage = "https://pidgin.im/";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
