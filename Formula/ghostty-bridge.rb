class GhosttyBridge < Formula
  desc "CLI for AI agents to communicate across Ghostty terminal panes"
  homepage "https://github.com/est7/ghostty-bridge"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/est7/ghostty-bridge/releases/download/v0.5.0/ghostty-bridge-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "0069c3aa9b8aee7793b87185403aa56c89ba83364e8599bfbf3886d141999d20"
    end
  end

  def install
    bin.install "ghostty-bridge"
  end

  test do
    assert_match "ghostty-bridge", shell_output("#{bin}/ghostty-bridge --help")
  end
end
