class WxgtkAT2 < Formula
  #https://gist.github.com/jvalduvieco/4376555
  homepage 'http://www.wxwidgets.org'
  version '2.8.12'
  url "http://downloads.sourceforge.net/project/wxwindows/2.8.12/wxGTK-2.8.12.tar.gz"
  sha256 '13cf89f2c29bcb90bb56a31ac1af10f23003d3d43c3e4b24991518f5dc4e5abe'

  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "pkg-config" => :build
  depends_on "expat"
  depends_on "freeglut"
  depends_on "freetype"
  depends_on "gtk+"
  depends_on "jpeg"
  depends_on "libiconv"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "mesalib-glw"
  depends_on "sdl"
  depends_on "sdl_mixer"
  depends_on "zlib"

  patch do
    # stolen from https://github.com/macports/macports-ports/tree/master/graphics/wxWidgets-2.8/files
    url "https://raw.githubusercontent.com/Bl4Cc4t/homebrew-other/master/patches/wxgtk@2.diff"
    sha256 "2b6f2c4c7394603314e355c11495137d212f12f9a5a723d9fc6b2f08684958bc"
  end
  def install
    inreplace Dir["Makefile.in"] do |s|
      s.gsub! "wx/wxprec.h.gch wx/wxprec.h", "wx/wxprec.h.gch"
    end

    args=[
      "--enable-display",
      "--enable-graphics_ctx",
      "--enable-unicode",
      # "--enable-universal_binary",
      "--disable-debug",
      "--disable-sdltest",
      # "--disable-shared",
      "--prefix=#{prefix}",
      # "--with-mac",
      "--with-freetype",
      "--with-gtk",
      "--with-libjpeg",
      "--with-libpng",
      "--with-libtiff",
      "--with-macosx-version-min=no",
      "--with-opengl",
      # "--with-osx_cocoa",
      "--with-sdl",
      "--with-zlib",
      "--without-macosx-sdk",
      "--without-sdl",
    ]
    # ENV.append "CFLAGS", "-arch", "x86_64" # if MacOS.prefer_64_bit?
    # ENV.append "LDFLAGS", "-lGL", "-lGLU", "-lX11"
    # ENV.append "LDFLAGS", "-lGL", "-L/opt/X11/lib/"
    # ENV.append "CPPFLAGS", "-I/opt/X11/include"
    system "./configure", *args

    system "make install"

    cd "contrib" do
      system "make"
      system "make install"
    end
  end
end
