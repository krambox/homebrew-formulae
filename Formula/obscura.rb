class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.1/obscura-aarch64-macos.tar.gz"
    sha256 "5233da6426ec16667d7e4374b824189c6dfb3b325e5cf3fb5f04c7bc48b52a0f"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.1/obscura-x86_64-macos.tar.gz"
    sha256 "e6d0f8719998fa4460bccc712b20a1e524717d5c54e943f345227bd893ec9620"
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
