require "language/node"

class AssMotion < Formula
  desc "apply sets of tracking data onto an .ass file via the command line"
  homepage "https://github.com/Bl4Cc4t/ass_motion"

  head "https://github.com/Bl4Cc4t/ass_motion.git"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "run", "build"
    system "npm", "run", "pkg-macos"
    bin.install Dir["bin/*"]
  end
end
