class Proton < Formula
  desc "Compatibility tool for Steam Play based on Wine and additional components"
  homepage "https://github.com/ValveSoftware/Proton"
  version "4.2-6"
  url "https://github.com/ValveSoftware/Proton/archive/proton-4.2-6.tar.gz"
  sha256 "bfd3bcdf948c61414e7bee20c11729a205a521bb0bcdabe1d49f3e25cfde1770"
  head "https://github.com/ValveSoftware/Proton.git"

  depends_on "wget"
  depends_on "mingw-w64"
  depends_on "cmake"
  depends_on "nasm"
  depends_on "libtool"
  depends_on "automake"
  depends_on "meson"
  depends_on "glslang"
  depends_on :vagrant

  def install
    system ""
    system "make", "install"
  end
end
