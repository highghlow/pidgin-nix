{
  lib,
  stdenv,
  fetchFromGitHub,
  imagemagick,
  gettext,
  pidgin,
  json-glib,
  qrencode,
  nss
}:

stdenv.mkDerivation {
  pname = "purple-discord";
  version = "unstable-2026-10-25";

  src = fetchFromGitHub {
    owner = "EionRobb";
    repo = "purple-discord";
    rev = "ef5993d5677978c08df845601b385f42a23132a9";
    sha256 = "sha256-/ZuudmJacSZCOW3uZqrqe3YAL+0FKOR/SWvkug5ziNg=";
  };

  nativeBuildInputs = [
    imagemagick
    gettext
  ];
  buildInputs = [
    pidgin
    json-glib
    qrencode
    nss
  ];

  env = {
    PKG_CONFIG_PURPLE_PLUGINDIR = "${placeholder "out"}/lib/purple-2";
    PKG_CONFIG_PURPLE_DATADIR = "${placeholder "out"}/share";
  };

  meta = {
    homepage = "https://github.com/EionRobb/purple-discord";
    description = "Discord plugin for Pidgin";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ sna ];
  };
}
