class Mediaextract < Formula
  desc "Extracts media files (AVI, Ogg, Wave, PNG, ...) that are embedded within other files."
  homepage "http://panzi.github.com/mediaextract/"
  version "1.1"
  url "https://github.com/panzi/mediaextract/archive/v1.1.tar.gz"
  sha256 "4e63e7abd73c4c54c18b3d1914b38bd357d3384b17ce52d9fcb9b15cfc8e8b30"
  head "https://github.com/panzi/mediaextract.git"

  depends_on "help2man" => :build
  depends_on "gnu-sed" => :build

  def install
    inreplace Dir["Makefile"] do |s|
      s.gsub! "sed", "gsed"
    end

    system "make", "builddir"
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
