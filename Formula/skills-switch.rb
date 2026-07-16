class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.0/skills-switch_0.12.0_darwin_arm64.tar.gz"
      sha256 "9008dea9a0ad347bb163ed1f094342cd028580a5c15692422ae9e473317b4010"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.0/skills-switch_0.12.0_darwin_amd64.tar.gz"
      sha256 "0e57d690470b432ae9a42db59b120449a676144ce0e21b0d5ddbfaa727f07ff4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.0/skills-switch_0.12.0_linux_arm64.tar.gz"
      sha256 "e67f739033428ef1451a5856337d35c40b1fa87105d5aaf6bd555b1313ac8387"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.0/skills-switch_0.12.0_linux_amd64.tar.gz"
      sha256 "7d3accf8154f0401c5e25f1940a6b3c82e82f00eeaa31d3244d18974d5da7158"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
