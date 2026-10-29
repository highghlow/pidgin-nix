{
  stdenv,
  fetchFromGitHub,
  lib,
  meson,
  ninja,
  pidgin
}:

stdenv.mkDerivation rec {
  pname = "purple-events";
  version = "0.99.2";

  src = fetchFromGitHub {
    owner = "sardemff7";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-np1Wo9xqRclBY24Ww2WnQ1lxKEsRsM16BxinkfyPgKc=";
  };

  postPatch = ''
    substituteInPlace meson.build \
      --replace-fail "purple.get_variable('plugindir')" "'$out/lib/purple-2'" \
      --replace-fail "purple.get_variable('datadir')" "'$out/share'"
  '';

  buildInputs = [
    pidgin
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
