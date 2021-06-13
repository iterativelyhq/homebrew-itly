class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-2315/itly-v1.1.4-itly-2315.789/itly-v1.1.4-itly-2315.789.tar.gz"
  sha256 "9ced142b840d5854c0e5f9a206f1376daf01af23d64fe63675788b04a97fff9d"

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
