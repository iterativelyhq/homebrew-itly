class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-41640/ampli-v1.2.1-itly-41640.879/ampli-v1.2.1-itly-41640.879.tar.gz"
  sha256 "d5cd8853bf84b23420ed4f4856f2c33de9ea5aa529af7fce7217c2c26c1f8048"

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
