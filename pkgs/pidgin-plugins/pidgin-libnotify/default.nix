{
  lib,
  stdenv,
  fetchurl,
  pidgin,
  intltool,
  libnotify
}:

stdenv.mkDerivation rec {
  pname = "pidgin-libnotify";
  version = "0.14";
  src = fetchurl {
    url = "mirror://sourceforge/project/gaim-libnotify/pidgin-libnotify/pidgin-libnotify-${version}/pidgin-libnotify-${version}.tar.gz";
    hash = "sha256-dPSp8g4KSD3zmXQXjx8jgHhhdhiVErzUOOStooDsOr4=";
  };

  patches = [
    ./fix-libnotify.patch
  ];

  nativeBuildInputs = [
    intltool
  ];

  buildInputs = [
    pidgin
    libnotify
  ];

  makeFlags = [
    "gddir=${placeholder "out"}/lib/purple-2"
  ];

  meta = {
    homepage = "https://gaim-libnotify.sourceforge.net/";
    description = "Plugin for Pidgin 2.x which implements libnotify notification support";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = [ ];
  };
}
