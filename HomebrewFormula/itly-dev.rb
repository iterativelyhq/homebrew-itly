class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.875/ampli-v1.2.1-itly-41640.875.tar.gz"
  sha256 "4fda7450fd1d775a02970f021f785f8b1fdb9db8911eaa4e9aacf30a65785d39"

  depends_on "iterativelyhq/itly/itly-node-dev"

  def install
    inreplace "bin/ampli"", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/itly", "\"$DIR/node\"", "#{Formula["itly-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
