{
  autoreconfHook,
  fetchFromGitHub,
  glib,
  intltool,
  lib,
  libappindicator-gtk3,
  libtool,
  pidgin,
  stdenv,
}:

stdenv.mkDerivation rec {
  pname = "pidgin-indicator";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "philipl";
    repo = "pidgin-indicator";
    rev = version;
    sha256 = "sha256-eZ6hIzYqpQzO7kS4lEIzT0eSrA4kIiAmJhXBg1ZHV/A=";
  };

  nativeBuildInputs = [
    autoreconfHook
    intltool
  ];
  buildInputs = [
    glib
    libappindicator-gtk3
    libtool
    pidgin
  ];

  meta = {
    description = "AppIndicator and KStatusNotifierItem Plugin for Pidgin";
    homepage = "https://github.com/philipl/pidgin-indicator";
    maintainers = with lib.maintainers; [ imalison ];
    license = lib.licenses.gpl2;
    platforms = with lib.platforms; linux;
  };
}
