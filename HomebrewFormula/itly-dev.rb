class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/amply-v1.2.1-itly-41640.856/amply-v1.2.1-itly-41640.856.tar.gz"
  sha256 "66a04f78173d15f3ba6fb73993d7dfdf4ade676dd414a53bcad02066b67b5311"

  depends_on "iterativelyhq/itly/itly-node-dev"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/itly", "\"$DIR/node\"", "#{Formula["itly-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
