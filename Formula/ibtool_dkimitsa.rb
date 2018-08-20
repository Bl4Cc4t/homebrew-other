class IbtoolDkimitsa < Formula
  desc "iOS Interface Builder utility, implemented in python."
  homepage "https://github.com/dkimitsa/ibtool/tree/advanced_ibdump"
  head "https://github.com/dkimitsa/ibtool.git", :branch => "advanced_ibdump"

  depends_on "python@2"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/5a/df/b2e3d9693bb0dcbeac516a73dd7a9eb82b126ae52e4a74605a9b01beddd5/setuptools-40.1.0.zip"
    sha256 "664500268e4d649ce5b9f9dc0af0edc2b144666b1544d64af0453da94aa72b70"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[setuptools].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  # test do
  #   assert_match version.to_s, shell_output("#{bin}/livestreamer --version 2>&1")
  # end
end
