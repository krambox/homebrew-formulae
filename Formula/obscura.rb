class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.6/obscura-aarch64-macos.tar.gz"
    sha256 "19faa248ac762f466ddb822dbb03ed4f097312d10d1a4d5b2143e6040a9bebd0"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.6/obscura-x86_64-macos.tar.gz"
    sha256 "897f03df4e3d704f946c5e14c6a90a34e0d4e4ef898c4b3201771712962cd7fb"
  end

  license "Apache-2.0"

  def install
    bin.install "obscura"
    bin.install "obscura-worker"
  end

  test do
    system bin/"obscura", "--version"
  end
end
