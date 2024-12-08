{ pkgs ? import <nixpkgs> {} }:

let
  # Define the download directory (this can be any path you choose)
  downloadDir = "/tmp/aria2_downloads";
in

pkgs.stdenv.mkDerivation rec {
  pname = "hercules-ci-aria2-example";
  version = "1.0";

  # Dependencies
  nativeBuildInputs = [ pkgs.aria2 ];

  # Build steps
  buildPhase = ''
    mkdir -p ${downloadDir}  # Create the download directory
    echo "Downloading files with aria2..."
    
    # Use aria2 to download files
    ${pkgs.aria2}/bin/aria2c -d ${downloadDir} -x 16 -s 16 "http://example.com/file1.zip"
    ${pkgs.aria2}/bin/aria2c -d ${downloadDir} -x 16 -s 16 "http://example.com/file2.zip"

    # Optionally list the downloaded files
    ls -lh ${downloadDir}
  '';

  # Optionally, specify installation steps or artifact creation
  installPhase = ''
    echo "Files downloaded successfully. Now installing..."
    # You can install additional files or artifacts here
  '';
}

