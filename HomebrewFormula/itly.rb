class Itly < Formula
  desc "The Itly CLI"
  homepage "https://iterative.ly/"
  url "https://cli-assets.iterative.ly/itly-v0.1.2/itly-v0.1.2.tar.gz"
  sha256 "cdbb543f99ad26a3595277a69fb5c29048e47e1c3bcfdbe12e4fe2ad22442d27"

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
