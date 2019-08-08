require_relative "../github_download_strategy.rb"

class SkPyscrapers < Formula
  include Language::Python::Virtualenv

  # desc ""
  homepage "https://github.com/Bl4Cc4t/sk-pyscrapers"
  version "0.1.1"
  url "https://github.com/Bl4Cc4t/sk-pyscrapers/archive/0.1.1.tar.gz", :using => CustomGitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "d3cd66e87fa8f6040e205a964d7e9f29b0313a3d2de22f12760c58a2d19dbc3c"
  head "https://github.com/Bl4Cc4t/sk-pyscrapers.git"

  depends_on "python"

  resource "cfscrape" do
    url "https://files.pythonhosted.org/packages/6c/0b/ea6730d075cabe49c1c46d330392c81ab53f09e1a196d79f50c83c000522/cfscrape-2.0.7.tar.gz"
    sha256 "386873257c79280552901ecc2544b185daecf9ef27c126c542daa94b6fea09bf"
  end

  resource "elasticsearch" do
    url "https://files.pythonhosted.org/packages/c1/e9/35d9c0d5c6467a05f3528f21a3d56f0063fe8cf5658080dc144e3b0ac154/elasticsearch-7.0.2.tar.gz"
    sha256 "386873257c79280552901ecc2544b185daecf9ef27c126c542daa94b6fea09bf"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/01/62/ddcf76d1d19885e8579acb1b1df26a852b03472c0e46d2b959a714c90608/requests-2.22.0.tar.gz"
    sha256 "cbc73831c63fa2824538df76fcb2c4be007b43dbd9e7788ae70ea6d24109925b"
  end

  resource "sk_pytools" do
    url "https://github.com/Bl4Cc4t/sk-pytools/archive/0.0.3.tar.gz", :using => CustomGitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "c48136a34d230f582dbc89a264f5ea858d301b7f43989fad22f81a9eb404b123"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/d0/0a/50a145091ce0c02db89d0342a59327c1ddeee206ef2991f09158d4e52406/tqdm-4.32.2.tar.gz"
    sha256 "25d4c0ea02a305a688e7e9c2cdc8f862f989ef2a4701ab28ee963295f5b109ab"
  end

  def install
    virtualenv_install_with_resources
  end
end
