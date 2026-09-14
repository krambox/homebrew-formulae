class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.2/obscura-aarch64-macos.tar.gz"
    sha256 "607471654d0c23799abd3bf45d1f4afd314a11fdbe1ee376e29018f32a2dfab9"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.2/obscura-x86_64-macos.tar.gz"
    sha256 "a60ad71a9e8d6ab1b8f51d3ddca8e043178b9c03c704719d6e717f77ead3ee43"
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
