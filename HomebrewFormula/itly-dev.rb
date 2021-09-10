class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.878/ampli-v1.2.1-itly-41640.878.tar.gz"
  sha256 "919611f2b2c2766e2dadb7d72834539ed546611eeba40e2d241f11dfd958261f"

  depends_on "iterativelyhq/itly/itly-node-dev"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["itly-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
