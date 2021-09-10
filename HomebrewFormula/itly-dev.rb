class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.877/ampli-v1.2.1-itly-41640.877.tar.gz"
  sha256 "1a99fb5e35bd90644285027ab763a377c26416a4a89b855d7b2973d56c501f29"

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
