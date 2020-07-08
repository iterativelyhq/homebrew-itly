class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-291/itly-v0.1.2-itly-291.512/itly-v0.1.2-itly-291.512.tar.gz"
  sha256 "f2f33405d09aab4fa8ed7d6f99d52c03c0156d0f833e90c92cd0ade4355b2f1a"

  depends_on "node"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
