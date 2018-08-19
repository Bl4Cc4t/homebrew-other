class Opencflite < Formula
  desc "A cross platform toolkit for building applications on Mac OS X, Windows, and Linux."
  homepage "https://sourceforge.net/projects/opencflite"
  version "476.19.0"
  url "https://sourceforge.net/projects/opencflite/files/opencflite/476.19.0/opencflite-476.19.0.tar.gz/download"
  sha256 "3b593967e17de080491a5c18ee0938a6cce8f3f4a06ff62b042351e681fef549"
  head "svn://svn.code.sf.net/p/opencflite/code/trunk"

  depends_on "icu4c" => :build
  depends_on "pkg-config" => :build
  depends_on "ossp-uuid" => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"#, "PREFIX=#{prefix}"
  end
end
