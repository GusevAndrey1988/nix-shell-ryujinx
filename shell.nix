with import <nixpkgs> {};
mkShell {
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    stdenv.cc.cc
    icu
    gcc
    fontconfig
    openssl

    xorg.libX11
    libgdiplus
    SDL2_mixer
    openal
    libsoundio
    sndio
    pulseaudio
    vulkan-loader
    ffmpeg
    udev

    # Avalonia UI
    glew
    xorg.libICE
    xorg.libSM
    xorg.libXcursor
    xorg.libXext
    xorg.libXi
    xorg.libXrandr

    # Headless executable
    libGL
    SDL2
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";

  shellHook = ''
    ./Ryujinx
    exit
  '';
}
