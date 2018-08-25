class P0sixspwn < Formula
  desc "iOS Jailbreak for 6.1.[3-4-5-6]"
  homepage "https://ih8sn0w.com/p0sixspwn.html"
  head "https://github.com/yanniks/p0sixspwn.git"

  # depends_on 'autom4te' => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libplist"
  depends_on "libzip"
  depends_on "openssl"

  patch do
    url "https://raw.githubusercontent.com/Bl4Cc4t/homebrew-other/master/patches/p0sixspwn.diff"
    sha256 "caacafedd997ca04933194ae697e8fa7f6b8c6033b1f553c2df7f60f9fae79fe"
  end
  def install
    inreplace Dir["autogen.sh"] do |s|
      s.gsub! "./configure", "#./configure"
    end
    # ENV.append "CPPFLAGS", "-I#{Formula["libiconv"].opt_include}"
    # ENV.append "LDFLAGS", "-L#{Formula["libiconv"].opt_lib}"
    #
    # (buildpath/"build").mkpath
    # Dir.chdir("#{buildpath}/build")
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make"
    system "make", "install"
  end
end
