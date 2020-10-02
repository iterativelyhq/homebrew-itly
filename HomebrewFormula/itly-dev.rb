class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-1146/itly-v0.1.11-itly-1146.602/itly-v0.1.11-itly-1146.602.tar.gz"
  sha256 "99c8720de723b60d6228f9d423a038820c2d8477c7db268b1e1b564dd5ca411d"

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
