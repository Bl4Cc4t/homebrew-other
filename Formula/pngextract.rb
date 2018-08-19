class Pngextract < Formula
  desc "Extract embedded PNG images from (binary) files"
  homepage "https://github.com/jomo/PNGExtract"
  head "https://github.com/jomo/PNGExtract.git"

  def install
    prefix.install Dir["README.md", "LICENSE.txt"]
    bin.install Dir["pngextract"]
  end
end
