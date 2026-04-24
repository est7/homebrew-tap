class GhosttyBridge < Formula
  desc "CLI for AI agents to communicate across Ghostty terminal panes"
  homepage "https://github.com/est7/ghostty-bridge"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/est7/ghostty-bridge/releases/download/v0.2.0/ghostty-bridge-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "90aaf2030a9d55c413356efd4f02133a8d0a6f43908f42bd8973bdecac1bd67c"
    end
  end

  def install
    bin.install "ghostty-bridge"
  end

  test do
    assert_match "ghostty-bridge", shell_output("#{bin}/ghostty-bridge --help")
  end
end