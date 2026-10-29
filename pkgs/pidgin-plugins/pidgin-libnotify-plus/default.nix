{
  stdenv,
  fetchFromGitHub,
  lib,
  meson,
  ninja,
  pidgin,
  purple-events,
  libnotify
}:

stdenv.mkDerivation rec {
  pname = "purple-libnotify-plus";
  version = "2.99.2";

  src = fetchFromGitHub {
    owner = "sardemff7";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-967VKfRjy5eQiFda5mqW3eLqvuPqWEDoIsixhZNNmsU=";
  };

  postPatch = ''
    substituteInPlace meson.build \
      --replace-fail "purple.get_variable('plugindir')" "'$out/lib/purple-2'" \
      --replace-fail "purple.get_variable('datadir')" "'$out/share'"
  '';

  buildInputs = [
    pidgin
    purple-events
    libnotify
  ];

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = {
    description = "libpurple events handling plugin and library";
    homepage = "https://github.com/sardemff7/purple-events";
    license = lib.licenses.gpl3;
  };
}
