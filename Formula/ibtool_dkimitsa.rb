class IbtoolDkimitsa < Formula
  desc "iOS Interface Builder utility, implemented in python."
  homepage "https://github.com/dkimitsa/ibtool/tree/advanced_ibdump"
  head "https://github.com/dkimitsa/ibtool.git", :branch => "advanced_ibdump"

  depends_on "python@2"

  def install
    prefix.install Dir["*.md"]
    libexec.install Dir["*.py", "*.pyc"]
    bin.install_symlink libexec/"ibdump2.py"
  end
end
