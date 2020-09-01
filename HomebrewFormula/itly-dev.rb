class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-1061/itly-v0.1.9-itly-1061.584/itly-v0.1.9-itly-1061.584.tar.gz"
  sha256 "6629bfa930c912efe3334ee690cf63bf10bf22fcb8f264981cec9df5b3b809e8"

  depends_on "node"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
