class Jar2app < Formula
  desc "Convert any Java jar to a Mac OS X .App bundle. No external tools needed, no funky parameters, it just works."
  head "https://github.com/Jorl17/jar2app.git"

  depends_on "python3"

  def install
    prefix.install Dir["*.md"]
    prefix.install Dir["LICENSE"]
    bin.install Dir["*.py"]
    bin.install Dir["jar2app_basefiles"]
  end
end
