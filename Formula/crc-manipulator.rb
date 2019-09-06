class CrcManipulator < Formula
  desc "Change CRC checksums of your files."
  homepage "https://github.com/rr-/CRC-manipulator"
  head "https://github.com/rr-/CRC-manipulator.git"

  depends_on "cmake" => :build
  depends_on "python" => :build
  depends_on "wget" => :build

  def install
    system "./bootstrap"
    system "python3", "waf", "configure", "--prefix=#{prefix}"
    system "python3", "waf", "build"
    system "python3", "waf", "install"
  end
end
