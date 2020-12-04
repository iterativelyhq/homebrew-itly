class ItlyDev < Formula
  desc "The Itly CLI (Dev)"
  homepage "https://iterative.ly/"
  url "https://cli-assets-dev.iterative.ly/channels/itly-1122/itly-v0.1.11-itly-1122.646/itly-v0.1.11-itly-1122.646.tar.gz"
  sha256 "1e94d79b748a65c187b344fb51a2cb6f40ef28f31517f28dc92bac340e62e7c7"

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
