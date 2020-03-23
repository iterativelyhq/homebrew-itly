class Itly < Formula
  desc "The Itly CLI"
  homepage "https://iterative.ly/"
  url "https://cli-assets.iterative.ly/itly-v0.0.53/itly-v0.0.53.tar.gz"
  sha256 "ebf92aed8640bcc615efb9cd048b5fca7ee69c01b03abba5923f2c8f84b7a9da"

  depends_on "node"

  def install
    inreplace "bin/itly", /^CLIENT_HOME=/, "export ITLY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/itly" => "itly"
  end

  test do
    system bin/"itly", "version"
  end
end
