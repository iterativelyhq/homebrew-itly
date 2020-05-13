class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/build/itly-v0.0.56-build.430/itly-v0.0.56-build.430.tar.gz"
  sha256 "056bc5e3f947290b30af4836d12a5f8da472bda09751996e9be3f495afa16037"

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
