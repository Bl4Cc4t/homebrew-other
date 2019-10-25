require "language/node"

class Lanraragi < Formula
  desc "Web application for archival and reading of manga/doujinshi. Lightweight and Docker-ready for NAS/servers."
  homepage "https://github.com/Difegue/LANraragi"
  # version "0.6.0-BETA.2"
  # url "https://github.com/Difegue/LANraragi/archive/v.0.6.0-BETA.2.tar.gz"
  # sha256 "6c6c56246993e1b8cf752cbb301484f8f6dc85a95d89f2916a4ccea9ccc2582c"
  head "https://github.com/Bl4Cc4t/LANraragi.git", :branch => "homebrew-test"

  depends_on "pkg-config" => :build
  depends_on "cpanminus"
  depends_on "libarchive"
  depends_on "libjpeg"
  depends_on "libpng"
  depends_on "node"
  depends_on "openssl"
  depends_on "perl" => "5.20.2"
  depends_on "redis"

  # pre dependencies
  resource "Capture::Tiny" do
    url "https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-0.48.tar.gz"
    sha256 "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
  end

  resource "Config::AutoConf" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/Config-AutoConf-0.317.tar.gz"
    sha256 "01e4b22d2fecb7cfd3cc1f4dabe95cd137cf249cc5e38184f88556e5c98a9ce1"
  end

  resource "Module::Build" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-0.4229.tar.gz"
    sha256 "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
  end

  # actual dependencies
  resource "Archive::Extract::Libarchive" do
    url "https://cpan.metacpan.org/authors/id/L/LB/LBROCARD/Archive-Extract-Libarchive-0.38.tar.gz"
    sha256 "afb74a59e46819ab6a85b5d7f0840da71cb3b97fa3a3c3cbf6d59099a868acc9"
  end

  resource "Archive::Peek::Libarchive" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/Archive-Peek-Libarchive-0.38.tar.gz"
    sha256 "332159603c5cd560da27fd80759da84dad7d8c5b3d96fbf7586de2b264f11b70"
  end

  resource "Authen::Passphrase" do
    url "https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Authen-Passphrase-0.008.tar.gz"
    sha256 "55db4520617d859d88c0ee54965da815b7226d792b8cdc8debf92073559e0463"
  end

  resource "Compress::Zlib" do
    url "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.087.tar.gz"
    sha256 "94f792775d0496fffe862363c76637e74ff5b46c40cf47042547686d164e23cb"
  end

  resource "Cpanel::JSON::XS" do
    url "https://cpan.metacpan.org/authors/id/R/RU/RURBAN/Cpanel-JSON-XS-4.12.tar.gz"
    sha256 "49417b118fb111607cc7d021443e5b32fd104c0bf59d1852c95923a4916ac658"
  end

  resource "Digest::SHA" do
    url "https://cpan.metacpan.org/authors/id/M/MS/MSHELOR/Digest-SHA-6.02.tar.gz"
    sha256 "2c66a6bea3eac9c210315ac7bf0af3e2e35679c4b65d8bae1ad4be3a58039b06"
  end

  resource "Encode" do
    url "https://cpan.metacpan.org/authors/id/D/DA/DANKOGAI/Encode-3.01.tar.gz"
    sha256 "d4555f570491648dbbd602bce7966672834b4c8f45acaa6757de474fca3a4d87"
  end

  resource "File::ChangeNotify" do
    url "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/File-ChangeNotify-0.31.tar.gz"
    sha256 "192bdb1ce76266c6a694a8e962d039e3adeeb829b6ac1e23f5057f2b506392bd"
  end

  resource "File::Find::utf8" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAYOBAAN/File-Find-utf8-0.013.tar.gz"
    sha256 "7463c18f2b19896e7146caa1dd1fcb0a966377c3f3d44e0f687d4eed7d3aa03d"
  end

  resource "File::ReadBackwards" do
    url "https://cpan.metacpan.org/authors/id/U/UR/URI/File-ReadBackwards-1.05.tar.gz"
    sha256 "82b261af87507cc3e7e66899c457104ebc8d1c09fb85c53f67c1f90f70f18d6e"
  end

  resource "Image::Scale" do
    url "https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Image-Scale-0.14.tar.gz"
    sha256 "f09c5f0663b87738365ac2819e186b909abeb9ed85d83bc15ee76872c947cdf8"
  end

  resource "IO::Socket::SSL" do
    url "https://cpan.metacpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-2.066.tar.gz"
    sha256 "0d47064781a545304d5dcea5dfcee3acc2e95a32e1b4884d80505cde8ee6ebcd"
  end

  resource "IPC::Cmd" do
    url "https://cpan.metacpan.org/authors/id/B/BI/BINGOS/IPC-Cmd-1.04.tar.gz"
    sha256 "d110a0f60e35c65721454200f0d2f0f8965529a2add9649d1fa6f4f9eccb6430"
  end

  resource "local::lib" do
    url "https://cpan.metacpan.org/authors/id/H/HA/HAARG/local-lib-2.000024.tar.gz"
    sha256 "2e9b917bd48a0615e42633b2a327494e04610d8f710765b9493d306cead98a05"
  end

  resource "Logfile::Rotate" do
    url "https://cpan.metacpan.org/authors/id/P/PA/PAULG/Logfile-Rotate-1.04.tar.gz"
    sha256 "810f8b7ccd8657d3b1ef53cd47582547845cebb58202b05539b3408638cada3e"
  end

  resource "Module::Pluggable" do
    url "https://cpan.metacpan.org/authors/id/S/SI/SIMONW/Module-Pluggable-5.2.tar.gz"
    sha256 "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
  end

  resource "Mojo::IOLoop::ProcBackground" do
    url "https://cpan.metacpan.org/authors/id/B/BP/BPMEDLEY/Mojo-IOLoop-ProcBackground-0.06.tar.gz"
    sha256 "b1b10455bd0a8105e5713ab2decd1d7eb2ee9bfa4d7394748e32d4077164d2a3"
  end

  resource "Mojolicious" do
    url "https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-8.22.tar.gz"
    sha256 "86e34a50f7daeb7af43655d7b3bfe43bb09124216bfaf3016e6fd975c3f24854"
  end

  resource "Mojolicious::Plugin::RenderFile" do
    url "https://cpan.metacpan.org/authors/id/K/KO/KOORCHIK/Mojolicious-Plugin-RenderFile-0.12.tar.gz"
    sha256 "013e42a2cc06bc7041bb13c9df388af24010e69793a8df0f0ab1d240aa61173f"
  end

  resource "Mojolicious::Plugin::TemplateToolkit" do
    url "https://cpan.metacpan.org/authors/id/D/DB/DBOOK/Mojolicious-Plugin-TemplateToolkit-0.005.tar.gz"
    sha256 "172913a7a655081d77b306ac8a1aab8deb8786daf1bf5faaccefc6690b0ac626"
  end

  resource "Proc::Simple" do
    url "https://cpan.metacpan.org/authors/id/M/MS/MSCHILLI/Proc-Simple-1.32.tar.gz"
    sha256 "4c8f0a924b19ad78a13da73fe0fb306d32a7b9d10a332c523087fc83a209a8c4"
  end

  resource "Redis" do
    url "https://cpan.metacpan.org/authors/id/D/DA/DAMS/Redis-1.995.tar.gz"
    sha256 "a0b07b284ff12bb852a3120723f1e63ab279df575d6c52a78f914565a9f0b906"
  end

  resource "Test::Harness" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Test-Harness-3.42.tar.gz"
    sha256 "0fd90d4efea82d6e262e6933759e85d27cbcfa4091b14bf4042ae20bab528e53"
  end

  resource "URI::Escape" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-1.76.tar.gz"
    sha256 "b2c98e1d50d6f572483ee538a6f4ccc8d9185f91f0073fd8af7390898254413e"
  end


  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", libexec/"lib"

    resources = [
      "Capture::Tiny",
      "Config::AutoConf",
      "Module::Build",
      "Archive::Extract::Libarchive",
      "Archive::Peek::Libarchive",
      "Authen::Passphrase",
      "Compress:Zlib",
      "Cpanel::JSON::XS",
      "Digest::SHA",
      "Encode",
      "File::ChangeNotify",
      "File::Find::utf8",
      "File::ReadBackwards",
      "Image::Scale",
      "IO::Socket::SSL",
      "IPC::Cmd",
      "local::lib",
      "Logfile::Rotate",
      "Module::Pluggable",
      "Mojo::IOLoop::ProcBackground",
      "Mojolicious",
      "Mojolicious::Plugin::RenderFile",
      "Mojolicious::Plugin::TemplateToolkit",
      "Proc::Simple",
      "Redis",
      "Test::Harness",
      "URI::Escape",
    ]
    resources.each do |r|
      resource(r).stage do
        if r == "Archive::Extract::Libarchive" or r == "Mojolicious::Plugin::TemplateToolkit"
          system "perl", "Build.PL", "--install_base", libexec
          system "./Build"
          system "./Build", "install"
        else
          system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
          system "make"
          system "make", "install"
        end

      end
    end

    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "run", "lanraragi-installer", "install-full"
    prefix.install "lib"
    prefix.install "script"
    prefix.install "lrr.conf"
    prefix.install "package.json"
    prefix.install "public"
    prefix.install "README.md"
    prefix.install "templates"
    prefix.install "log"
    prefix.install "tools/homebrew-start/redis.conf"
    bin.install "tools/homebrew-start/lanraragi"
  end
end
