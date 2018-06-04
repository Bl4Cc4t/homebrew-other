class Danmaku2ass < Formula
  desc "Convert comments from Niconico/AcFun/bilibili to ASS format"
  homepage "http://m13253.blogspot.com/2013/11/play-danmaku-offline-danmaku2ass.html"
  head "https://github.com/m13253/danmaku2ass.git"

  depends_on "gettext" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
