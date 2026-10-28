{
  stdenv,
  lib,
  fetchFromGitHub,
  pidgin,
  qrencode,
  rustPlatform,
  protobuf,
  openssl,
}:

let
  version = "nightly-20261021";

  src = fetchFromGitHub {
    owner = "hoehermann";
    repo = "purple-presage";
    rev = "99ce7efdde6f4489b728d999776a69bff4f51925";
    hash = "sha256-ytlEhazapWLktsDH8VALbQXy5ZWUctMjDzAeZToXt2Y=";
  };

  rust = rustPlatform.buildRustPackage {
    pname = "purple-presage-rust";

    inherit version;
    src = "${src}/src/rust";

    buildType = "debug";

    nativeBuildInputs = [
      protobuf
    ];

    buildInputs = [
      openssl
    ];

    cargoHash = "sha256-/IySmycmUT7NBE59UH3wpfYA/XutaGqdAYQyFSuVe3o=";

    doCheck = false;
  };
in
stdenv.mkDerivation {
  pname = "purple-presage";

  inherit src version;

  postPatch = ''
    rm -rf src/rust
    mkdir -p src/rust/target/debug/
    cp ${rust}/lib/libpurple_presage_backend.a src/rust/target/debug/
    echo none: > src/rust/Makefile
    echo -e \\techo skip >> src/rust/Makefile
  '';

  nativeBuildInputs = [
    rust
  ];

  buildInputs = [
    pidgin
    qrencode
    openssl
  ];

  buildPhase = ''
    make LDFLAGS=-lcrypto
  '';

  installPhase = ''
    make install PLUGIN_DIR=$out/lib/purple-2 DATA_ROOT_DIR=$out/share
  '';

  meta = {
    homepage = "https://github.com/hoehermann/purple-presage";
    description = "Pidgin/libpurple plug-in for Signal messenger using presage.";
    license = lib.licenses.gpl3;
  };
}
