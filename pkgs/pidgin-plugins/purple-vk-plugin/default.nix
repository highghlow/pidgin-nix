{
  lib,
  stdenv,
  fetchFromGitHub,
  pidgin,
  cmake,
  libxml2,
}:

stdenv.mkDerivation {
  pname = "purple-vk-plugin";
  version = "unstable-2018-06-08";

  src = fetchFromGitHub {
    owner = "SergeyDjam";
    repo = "purple-vk-plugin";
    rev = "33b0b1ecd9363f37aa10b1aa908dc844b3091533";
    sha256 = "sha256-QAS+HO6IsrisL1wVroYvs6Uf0l2r60eAjI3qrYX2o6c=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    pidgin
    libxml2
  ];

  preConfigure = ''
    sed -i -e 's|DESTINATION.*PURPLE_PLUGIN_DIR}|DESTINATION lib/purple-2|' CMakeLists.txt
  '';

  cmakeFlags = [ "-DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=1" ];

  meta = {
    homepage = "https://github.com/SergeyDjam/purple-vk-plugin";
    description = "Vk (russian social network) plugin for Pidgin / libpurple";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
  };
}
