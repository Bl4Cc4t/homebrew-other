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

  # fix:
  # -CMake Error at CMakeLists.txt:115 (else):
  #    A duplicate ELSE command was found inside an IF block.
  # -src/algo/call_stack_keeper.cc:33:15:
  #    error: no matching conversion for functional-style cast from 'const char [24]' to 'err::GeneralError'
  # -src/dec/jpeg/jpeg_image_decoder.cc:26:5:
  #    error: no matching function for call to 'jpeg_read_header'
  #    jpeg_read_header(&info, true);
  patch do
    url "https://raw.githubusercontent.com/Bl4Cc4t/homebrew-other/master/patches/arc_unpacker.diff"
    sha256 "6f87a6a5331dab13864bfc040fc35c801deffe281ed45e7f57935b0b18cab826"
  end
  def install
    ENV.append "CPPFLAGS", "-I#{Formula["zlib"].opt_include}"
    ENV.append "LDFLAGS", "-L#{Formula["zlib"].opt_lib}"

    (buildpath/"build").mkpath
    Dir.chdir("#{buildpath}/build")
    system "cmake", "-DCMAKE_BUILD_TYPE=release", ".."
    system "make", "-j8", "arc_unpacker"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
