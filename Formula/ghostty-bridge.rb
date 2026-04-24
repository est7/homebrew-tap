class GhosttyBridge < Formula
  desc "CLI for AI agents to communicate across Ghostty terminal panes"
  homepage "https://github.com/est7/ghostty-bridge"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/est7/ghostty-bridge/releases/download/v0.4.0/ghostty-bridge-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "8df3d699cbbb91b3215e464f5eac9453cbc98e76d95b6b5776c796564b84f652"
    end
  end

  def install
    bin.install "ghostty-bridge"
  end

  test do
    assert_match "ghostty-bridge", shell_output("#{bin}/ghostty-bridge --help")
  end
end
