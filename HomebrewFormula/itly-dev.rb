class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.876/ampli-v1.2.1-itly-41640.876.tar.gz"
  sha256 "49784c786a8bba86b1b8bf01f3feca980fa7b3dfd138486bac4ec3ce6de9ea93"

  depends_on "iterativelyhq/itly/itly-node-dev"

  def install
    inreplace "bin/ampli"", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["itly-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
