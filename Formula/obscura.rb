class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.1.6/obscura-aarch64-macos.tar.gz"
    sha256 "9bd1ad1adcf7046c973ed6522f3bca7b3e35daf1b6d9fbecf7097f10a64f2158"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.1.6/obscura-x86_64-macos.tar.gz"
    sha256 "fb1cb0d3591f98c1dc924f77a689515318c31db5385e515f0a174eb10c8d520a"
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
