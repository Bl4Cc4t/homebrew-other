class Wxmedit < Formula
  desc "wxMEdit, a cross-platform Text/Hex Editor, an improved version of MadEdit"
  homepage "http://wxmedit.github.io/"
  # version "0.11"
  # url "https://github.com/wxMEdit/wxMEdit/archive/3.1_FIX1.tar.gz"
  # sha256 "51dd81ddd44c83017d2e54f8b0a11a50e56075e8edc01d738865478fdddd8017"
  head "https://github.com/wxMEdit/wxMEdit.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "gettext"
  depends_on "gtk+"
  depends_on "icu4c"
  depends_on "wxmac"
  depends_on "wxwidgets"

  # option "with-bundle", "Enable compilation of the .app bundle."

  def install
    inreplace Dir["src/mad_utils.cpp", "src/wxm/utils.cpp"] do |s|
      s.gsub! "wx/mac/private.h", "wx/osx/private.h"
    end

    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"

    # if build.with? "bundle"
    #   system "python", "TOOLS/osxbundle.py", "build/mpv"
    #   prefix.install "build/mpv.app"
    # end
  end
end
