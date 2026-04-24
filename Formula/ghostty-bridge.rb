class GhosttyBridge < Formula
  desc "CLI for AI agents to communicate across Ghostty terminal panes"
  homepage "https://github.com/est7/ghostty-bridge"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/est7/ghostty-bridge/releases/download/v0.3.0/ghostty-bridge-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "2f6cef82c0d323c180d784225e9d8c9ee117fb2d3d2abf63055a2515efb83a1c"
    end
  end

  def install
    bin.install "ghostty-bridge"
  end

  test do
    assert_match "ghostty-bridge", shell_output("#{bin}/ghostty-bridge --help")
  end
end
