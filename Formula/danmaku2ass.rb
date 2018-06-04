class Danmaku2ass < Formula
  desc "Convert comments from Niconico/AcFun/bilibili to ASS format"
  homepage "http://m13253.blogspot.com/2013/11/play-danmaku-offline-danmaku2ass.html"
  head "https://github.com/m13253/danmaku2ass.git"

  def install
    system "make", "NO_GETTEXT=YesPlease", "PREFIX=#{prefix}"
    system "make", "install"
  end
end
