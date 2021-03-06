class ArcUnpacker < Formula
  desc "CLI tool for extracting images and sounds from visual novels."
  homepage "https://github.com/vn-tools/arc_unpacker"
  # version "0.11"
  # url "https://github.com/vn-tools/arc_unpacker/archive/0.11.tar.gz"
  # sha256 "c962bbd45999f77c35f8cba416770c7228e03672ae28d8a181524585ba36a2c2"
  head "https://github.com/vn-tools/arc_unpacker.git"

  depends_on "boost"
  depends_on "libpng"
  depends_on "jpeg"
  depends_on "libiconv"
  depends_on "openssl"
  depends_on "zlib"
  depends_on "webp" => :optional
  depends_on "cmake" => :build

  def install
    ENV.append "OPENSSL_ROOT_DIR", "/usr/local/opt/openssl/"

    (buildpath/"build").mkpath
    Dir.chdir("#{buildpath}/build")
    system "cmake", "-DCMAKE_BUILD_TYPE=release", ".."
    system "make", "-j8", "arc_unpacker"
    bin.install Dir["arc_unpacker"]
    prefix.install Dir["*.md"]
  end
end
