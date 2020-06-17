class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/build/itly-v0.0.56-build.464/itly-v0.0.56-build.464.tar.gz"
  sha256 "7da15c931a334e1aa998d0bebb888d5ee12f0eace77b5ddd63a90b5bd0a1cefc"

  depends_on "node@12"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly-dev"
  end

  test do
    system bin/"itly-dev", "version"
  end
end
