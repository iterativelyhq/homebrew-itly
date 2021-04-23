class Itly < Formula
  desc "The Itly CLI"
  homepage "https://iterative.ly/"
  url "https://cli-assets.iterative.ly/itly-v1.1.5/itly-v1.1.5.tar.gz"
  sha256 "5334845b91e6dda48004ad526d7499e652ed6b5abd52ad22f2e63bf70f1c562b"

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
