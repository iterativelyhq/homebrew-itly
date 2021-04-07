class Itly < Formula
  desc "The Itly CLI"
  homepage "https://iterative.ly/"
  url "https://cli-assets.iterative.ly/itly-v1.1.4/itly-v1.1.4.tar.gz"
  sha256 "4bd3e0e1afa9893f854ac4ecb3ab9b152f619abd2ecdbea7a7cdf7e2c5eeb55a"

  depends_on "iterativelyhq/itly/itly-node"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/itly", "\"$DIR/node\"", "#{Formula["itly-node"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly"
  end

  test do
    system bin/"itly", "version"
  end
end
