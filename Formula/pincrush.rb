class Pincrush < Formula
  desc "Pincrush is an open PNG optimizer implementing Apple's proprietary CgBI format."
  homepage "http://howett.net/pincrush/"
  version "0.9.2"
  url "https://github.com/DHowett/pincrush/archive/0.9.2.tar.gz"
  sha256 "c428d05fb4705616dc9c6fbe5f57b3216e3fb7b9c1cdf6094dfdc85d4eb0b5be"
  head "https://github.com/DHowett/pincrush.git"

  def install
    system ".make", "target=native"
    # system "make", "install"
    prefix.install Dir["*"]
  end
end
