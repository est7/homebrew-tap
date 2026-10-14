class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.18.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.1/skills-switch_0.18.1_darwin_arm64.tar.gz"
      sha256 "bc901634614b20ff9732a01c5c57f9f3a8c5cc2b4c6eca629ff42b0243cac86b"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.1/skills-switch_0.18.1_darwin_amd64.tar.gz"
      sha256 "95ad7ea92b6eceb5f5349ac28c6e1a17b0a143780e1fd6557dd97fbe2e11af02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.1/skills-switch_0.18.1_linux_arm64.tar.gz"
      sha256 "8668891ce700af1878294f7dfb030367ef97eb8f21c44a3af641828f4c24a703"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.1/skills-switch_0.18.1_linux_amd64.tar.gz"
      sha256 "c850bc77a271443432d28675fb03a21fa7cb7dfc3789e3cc23de4f213c579c4e"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
