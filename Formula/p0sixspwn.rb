class P0sixspwn < Formula
  desc "iOS Jailbreak for 6.1.[3-4-5-6]"
  homepage "https://ih8sn0w.com/p0sixspwn.html"
  head "https://github.com/yanniks/p0sixspwn.git"

  depends_on "libplist"

  # patch do
  #   url "https://raw.githubusercontent.com/Bl4Cc4t/homebrew-other/master/patches/arc_unpacker.diff"
  #   sha256 "93c1555414668b134388b107703cfb0a512ab329d71f9f483ba2d03bd97ab7ac"
  # end
  def install
    # ENV.append "CPPFLAGS", "-I#{Formula["libiconv"].opt_include}"
    # ENV.append "LDFLAGS", "-L#{Formula["libiconv"].opt_lib}"
    #
    # (buildpath/"build").mkpath
    # Dir.chdir("#{buildpath}/build")
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "-j8", "arc_unpacker"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
