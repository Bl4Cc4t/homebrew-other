class Pamquicklookplugin < Formula
  desc "QuickLook plugin for Netpbm files (.PBM, .PGM, .PPM, .PAM)"
  homepage "https://github.com/AntonDukhovnikov/PAMQuickLookPlugIn"
  head "https://github.com/AntonDukhovnikov/PAMQuickLookPlugIn.git"


  def install
    mv "PAMQuickLookPlugIn-Info.plist" "Info.plist"

    inreplace "Info.plist" do |s|
      s.gsub! "${EXECUTABLE_NAME}", "PAMQuickLookPlugIn"
      s.gsub! "${PRODUCT_NAME}", "PAMQuickLookPlugIn"
      s.gsub! "${PRODUCT_NAME:rfc1034identifier}", "PAMQuickLookPlugIn"
    end

    prefix.install Dir["*.md"]
    prefix.install Dir["LICENSE"]
    libexec.install Dir["jar2app.py"]
    libexec.install Dir["jar2app_basefiles"]
    bin.install_symlink libexec/"jar2app.py" => "jar2app"
    bin.env_script_all_files(libexec, :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
