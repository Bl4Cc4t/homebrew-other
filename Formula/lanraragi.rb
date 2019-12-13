require "language/node"

class Lanraragi < Formula
  desc "Web application for archival and reading of manga/doujinshi. Lightweight and Docker-ready for NAS/servers."
  homepage "https://github.com/Difegue/LANraragi"
  url "https://github.com/Difegue/LANraragi/archive/v.0.6.7.tar.gz"
  sha256 "3b47fa5eae1e1bf2c25a328c38ab8f3c5807801dce53ff27968f7fab3f38dc43"
  head "https://github.com/Difegue/LANraragi.git", :branch => "master"

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

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", libexec/"lib"

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

    system "redis-server", "--daemonize", "yes"
    system "npm", "--prefix", prefix, "test"
    system "redis-cli", "shutdown"
  end
end
