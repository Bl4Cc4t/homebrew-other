require "language/node"

class Lanraragi < Formula
  desc "Web application for archival and reading of manga/doujinshi. Lightweight and Docker-ready for NAS/servers."
  homepage "https://github.com/Difegue/LANraragi"
  url "https://github.com/Difegue/LANraragi/archive/v.0.6.7.tar.gz"
  sha256 "3b47fa5eae1e1bf2c25a328c38ab8f3c5807801dce53ff27968f7fab3f38dc43"
  head "https://github.com/Difegue/LANraragi.git", :branch => "dev"

  depends_on "pkg-config" => :build
  depends_on "cpanminus"
  depends_on "giflib"
  depends_on "jpeg"
  depends_on "libarchive"
  depends_on "libpng"
  depends_on "node"
  depends_on "openssl"
  depends_on "perl"
  depends_on "redis"
  depends_on "imagemagick@6"


  resource "Image::Magick" do
    url "https://cpan.metacpan.org/authors/id/J/JC/JCRISTY/PerlMagick-6.89-1.tar.gz"
    sha256 "c8f81869a4f007be63e67fddf724b23256f6209f16aa95e14d0eaef283772a59"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", libexec/"lib"

    resource("Image::Magick").stage do
      inreplace "Makefile.PL" do |s|
        s.gsub! "include/ImageMagick-6", "opt/imagemagick@6/include/ImageMagick-6"
      end
      
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    system "npm", "install", *Language::Node.local_npm_install_args
    system "perl", "./tools/install.pl", "install-full"
    prefix.install "lib"
    prefix.install "script"
    prefix.install "lrr.conf"
    prefix.install "package.json"
    prefix.install "public"
    prefix.install "README.md"
    prefix.install "templates"
    prefix.install "log"
    prefix.install "tools/build/homebrew/redis.conf"
    bin.install "tools/build/homebrew/lanraragi"
    prefix.install "tests"
  end

  test do
    ENV["PERL5LIB"] = libexec/"lib/perl5"
    ENV["LRR_LOG_DIRECTORY"] = testpath/"log"

    # system "redis-server", "--daemonize", "yes"
    system "npm", "--prefix", prefix, "test"
    # system "redis-cli", "shutdown"
  end
end
