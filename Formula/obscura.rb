class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.0/obscura-aarch64-macos.tar.gz"
    sha256 "ccb0ee8a6905947d610beb1d7a250f7e6f8b9a75b1419fc59a9f3b607fabf54e"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.0/obscura-x86_64-macos.tar.gz"
    sha256 "72613618071c6bb75b4dbecfb79844232bcc5eeef2b53d7e3f424cb3ad42b345"
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
