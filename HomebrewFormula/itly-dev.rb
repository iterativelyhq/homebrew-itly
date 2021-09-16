class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.884/ampli-v1.2.1-itly-41640.884.tar.gz"
  sha256 "244412f2833377eaf9faf2ab895b267acbf8c1dc956fcc51bda5f9409a093d15"

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
