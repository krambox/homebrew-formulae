class Obscura < Formula
  desc "Headless browser engine for AI agents and web scraping"
  homepage "https://github.com/h4ckf0r0day/obscura"

  if Hardware::CPU.arm?
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.3/obscura-aarch64-macos.tar.gz"
    sha256 "45653cfad226f1c9b415603a2ed59477fcbd6335c742338ce133c05de0bdd056"
  else
    url "https://github.com/h4ckf0r0day/obscura/releases/download/v0.2.3/obscura-x86_64-macos.tar.gz"
    sha256 "d7c48122debc2ad9b24842df44560860dba765ea928b3f636b7f053225245116"
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
