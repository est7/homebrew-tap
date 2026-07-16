class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.11.0/skills-switch_0.11.0_darwin_arm64.tar.gz"
      sha256 "bac812730dd1085142a43f6b75d3f03d993c8a7e767edbd69ae05035c7d55d0f"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.11.0/skills-switch_0.11.0_darwin_amd64.tar.gz"
      sha256 "4174a4cd13a8392f7c596b32741602101093be73da16952eb8c63d78424a633f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.11.0/skills-switch_0.11.0_linux_arm64.tar.gz"
      sha256 "4f74663633c4c6e92ad694d77885c5d9a6f3cf4f7864d46f0a5ef95fddab1082"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.11.0/skills-switch_0.11.0_linux_amd64.tar.gz"
      sha256 "b414978b5e8825836b74b6141487b987963fd0c73594ed93bec1b664d0f3a328"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
