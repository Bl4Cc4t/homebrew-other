class ArcUnpacker < Formula
  desc "CLI tool for extracting images and sounds from visual novels."
  homepage "https://github.com/vn-tools/arc_unpacker"
  version "0.11"
  url "https://github.com/vn-tools/arc_unpacker/archive/0.11.tar.gz"
  sha256 "c962bbd45999f77c35f8cba416770c7228e03672ae28d8a181524585ba36a2c2"
  head "https://github.com/vn-tools/arc_unpacker.git"

  depends_on "boost"
  depends_on "libpng"
  depends_on "jpeg"
  depends_on "libiconv"
  depends_on "openssl"
  depends_on "webp" => :optional

  def install
    (buildpath/"build").mkpath
    Dir.chdir("#{buildpath}/build")
    system "cmake", "-DCMAKE_BUILD_TYPE=release", ".."
    system "make", "-j8"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
