class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.1/skills-switch_0.9.1_darwin_arm64.tar.gz"
      sha256 "99b6c4064dd0e9f29fe528366261795da6c13afdc4099202b58509e6cf1a0854"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.1/skills-switch_0.9.1_darwin_amd64.tar.gz"
      sha256 "3bf816f92258f7a09a6814ed0a313d56795c487cdd3e3d0554c29cb2c7aaa482"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.1/skills-switch_0.9.1_linux_arm64.tar.gz"
      sha256 "69bacb7d56975b3fdf0adfe656179ac81722f61cfebcb7fe21622d20eeff8426"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.1/skills-switch_0.9.1_linux_amd64.tar.gz"
      sha256 "6b71d5ad54449a4f5b34bf1f2e6b0268fef76d8a2e0254247c8d1a21d4ac1530"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
