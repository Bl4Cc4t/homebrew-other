class Pincrush < Formula
  desc "Pincrush is an open PNG optimizer implementing Apple's proprietary CgBI format."
  homepage "http://howett.net/pincrush/"
  version "0.9.2"
  url "https://github.com/DHowett/pincrush/archive/0.9.2.tar.gz"
  sha256 "6a9199599f284cb11e3c32b72c8581cff0c61a89ff26a6a70421234d94e18457"
  head "https://github.com/DHowett/pincrush.git"

  def install
    inreplace Dir["framework/makefiles/targets/Darwin/native.mk"] do |s|
      s.gsub! "gcc-4.2", "gcc"
      s.gsub! "g++-4.2", "g++"
      s.gsub! "ARCHS ?= i386 x86_64", "ARCHS := x86_64"
    end
    inreplace Dir["libpng/png.c", "libpng/pngerror.c"] do |s|
      s.gsub! "png_ptr = png_ptr;",       "//png_ptr = png_ptr;"
    end
    inreplace Dir["libpng/pngread.c", "libpng/pngwrite.c"] do |s|
      s.gsub! "transforms = transforms;", "//transforms = transforms;"
      s.gsub! "params = params;",         "//params = params;"
    end
    inreplace Dir["libpng/pngrutil.c"] do |s|
      s.gsub! "info_ptr = info_ptr;",       "//info_ptr = info_ptr;"
    end
    system "make", "target=native"
    # system "make", "install"
    prefix.install Dir["*"]
  end
end
