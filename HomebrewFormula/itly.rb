class Itly < Formula
  desc "The Itly CLI"
  homepage "https://iterative.ly/"
  url "https://cli-assets.iterative.ly/itly-v1.1.2/itly-v1.1.2.tar.gz"
  sha256 "14f99806e8a8de86e473df2e2d2fa296d9a327abbb46384fe3f6c64a0ec186e8"

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
