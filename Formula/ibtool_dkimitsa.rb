class IbtoolDkimitsa < Formula
  desc "iOS Interface Builder utility, implemented in python."
  homepage "https://github.com/dkimitsa/ibtool/tree/advanced_ibdump"
  head "https://github.com/dkimitsa/ibtool.git", :branch => "advanced_ibdump"

  depends_on "python@2"

  # resource "futures" do
  #   url "https://files.pythonhosted.org/packages/c0/12/927b89a24dcb336e5af18a8fbf581581c36e9620ae963a693a2522b2d340/futures-2.2.0.tar.gz"
  #   sha256 "151c057173474a3a40f897165951c0e33ad04f37de65b6de547ddef107fd0ed3"
  # end

  def install
    # ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    # # %w[futures requests singledispatch six].each do |r|
    # #   resource(r).stage do
    # #     system "python", *Language::Python.setup_install_args(libexec/"vendor")
    # #   end
    # end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  # test do
  #   assert_match version.to_s, shell_output("#{bin}/livestreamer --version 2>&1")
  # end
end
