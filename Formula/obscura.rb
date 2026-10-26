class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.5/obscura-aarch64-macos.tar.gz"
    sha256 "fcca31eba4280cd67a2e226ef4b015e432d5c089f78cefd074ad12bbc8e23345"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.5/obscura-x86_64-macos.tar.gz"
    sha256 "9f354cf929a577491d6ba0ef451e07baefffd19d34115330f69a0e463771d6cd"
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
