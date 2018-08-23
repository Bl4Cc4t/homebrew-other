class WxgtkAT2 < Formula
  #https://gist.github.com/jvalduvieco/4376555
  homepage 'http://www.wxwidgets.org'
  version '2.8.12'
  url "http://downloads.sourceforge.net/project/wxwindows/2.8.12/wxGTK-2.8.12.tar.gz"
  sha256 '13cf89f2c29bcb90bb56a31ac1af10f23003d3d43c3e4b24991518f5dc4e5abe'

  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "pkg-config" => :build
  depends_on 'gtk+'

  def install

    args=[
      "--with-libpng",
      "--with-opengl",
      "--with-libjpeg",
      "--with-libtiff",
      "--with-freetype",
      "--with-zlib",
      "--enable-unicode",
      "--disable-debug",
      "--prefix=#{prefix}",
      "--with-gtk"
    ]
    ENV.append "CFLAGS", '-arch x86_64' # if MacOS.prefer_64_bit?
    ENV.append 'LDFLAGS', '-lX11 -lGL -lGLU'
    # ENV.append "CFLAGS", "-fPIC"

    system "./configure", *args

    system "make install"

    cd "contrib" do
      system "make"
      system "make install"
    end
  end
end
