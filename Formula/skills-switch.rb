class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.0/skills-switch_0.4.0_darwin_arm64.tar.gz"
      sha256 "19acd528a664a6655b619870b601a89bf973564684c7d20f87776be1b8d42654"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.0/skills-switch_0.4.0_darwin_amd64.tar.gz"
      sha256 "cdc93e71ffe849c00d9c208384821808acf889ddce4c98563b3ba6125d274436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.0/skills-switch_0.4.0_linux_arm64.tar.gz"
      sha256 "185b8710371fc17113fb3b8bceb2291d78ea1b175720ed7b546589145fea4bea"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.0/skills-switch_0.4.0_linux_amd64.tar.gz"
      sha256 "d5415eb61d2a7005c36d5a1d5abfe127783e23388c9fc2772a9e584ef5947a2b"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
