class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.4/obscura-aarch64-macos.tar.gz"
    sha256 "456210fe48e77324a064477fe450452a58709940a50e71678ae6638a3e5095ec"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.4/obscura-x86_64-macos.tar.gz"
    sha256 "91b1b5e1f581e7572bdffd289195ad112cd5cf33069019e892b251c099bef015"
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
