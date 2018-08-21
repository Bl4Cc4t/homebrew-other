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
  depends_on "zlib"
  depends_on "webp" => :optional
  depends_on "cmake" => :build

  patch do
    url "https://raw.githubusercontent.com/Bl4Cc4t/homebrew-other/master/patches/arc_unpacker/CMakeLists.diff"
    sha256 "b00d03ae771137026d54d9f5c5b06b3930e05399a5ed266a5b8996c604716c83"
  end
  def install
    (buildpath/"build").mkpath
    Dir.chdir("#{buildpath}/build")
    system "cmake -DCMAKE_BUILD_TYPE=release .."
    system "make", "-j8"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
