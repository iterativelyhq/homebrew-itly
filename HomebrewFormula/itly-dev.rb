class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/master/itly-v1.2.1-master.839/itly-v1.2.1-master.839.tar.gz"
  sha256 "b7ce9c38cd309a17af71631716f452e1d00b836f042eabee25237f07008001e5"

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
