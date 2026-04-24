class GhosttyBridge < Formula
  desc "CLI for AI agents to communicate across Ghostty terminal panes"
  homepage "https://github.com/est7/ghostty-bridge"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/est7/ghostty-bridge/releases/download/v0.1.0/ghostty-bridge-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "29d5054637aa1a03233ac0821d919548b1cb157a2edf4802f8774f3dcc7bc0ed"
    end
  end

  def install
    bin.install "ghostty-bridge"
  end

  test do
    assert_match "ghostty-bridge", shell_output("#{bin}/ghostty-bridge --help")
  end
end
