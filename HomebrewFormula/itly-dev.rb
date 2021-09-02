class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/build/itly-v1.2.1-build.863/itly-v1.2.1-build.863.tar.gz"
  sha256 "1fdc61c404b0851d063ebcac0a8a83f8a72f8f6423d8f0c419c82104553dbfcc"

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
