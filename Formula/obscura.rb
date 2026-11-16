class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.7/obscura-aarch64-macos.tar.gz"
    sha256 "fc7e73f23058f18d6d5be983d83b24ba374d12167677657a307a9476c0f5a7c1"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.7/obscura-x86_64-macos.tar.gz"
    sha256 "c47383e5b5551e09d2055ee7bdcce788af409fb4394e39bdaf179734df18e829"
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
