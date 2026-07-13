class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.5.0/skills-switch_0.5.0_darwin_arm64.tar.gz"
      sha256 "931773c90980fa42fd93d5508c0aca27baba064caa94a3627e4589881d671a13"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.5.0/skills-switch_0.5.0_darwin_amd64.tar.gz"
      sha256 "d0be7220c83a52aabd65592a96623798998361e000a3c40fc3bdc4dfea3c15ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.5.0/skills-switch_0.5.0_linux_arm64.tar.gz"
      sha256 "7facf87d858a132533d1d9d61297d6acbd86ea82786c03df093d441021a07a4b"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.5.0/skills-switch_0.5.0_linux_amd64.tar.gz"
      sha256 "db2683a32276d35bcd1fa4b68e28329303b12a4c0b004fbd31dbcc05b2ed2dc8"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
