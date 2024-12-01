let
  rust_overlay =
    import (builtins.fetchGit {
      url = "https://github.com/oxalica/rust-overlay";
      ref = "refs/heads/master";
    });

  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };

  rust = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
in
pkgs.mkShell {
  buildInputs = [
    rust
    pkgs.aoc-cli 
  ];

   RUST_BACKTRACE = "full";
 }
