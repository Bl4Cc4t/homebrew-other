class Pincrush < Formula
  desc "Pincrush is an open PNG optimizer implementing Apple's proprietary CgBI format."
  homepage "http://howett.net/pincrush/"
  version "0.9.2"
  url "https://github.com/DHowett/pincrush/archive/0.9.2.tar.gz"
  sha256 "6a9199599f284cb11e3c32b72c8581cff0c61a89ff26a6a70421234d94e18457"
  head "https://github.com/DHowett/pincrush.git"

  def install
    system "make", "target=native"
    # system "make", "install"
    prefix.install Dir["*"]
  end
end
