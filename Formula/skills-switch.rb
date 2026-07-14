class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.0/skills-switch_0.9.0_darwin_arm64.tar.gz"
      sha256 "d6da3cd03d3fda6674b43aaa1e34d7d3e9ae11ee9e2c108185e29c22cb851bd0"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.0/skills-switch_0.9.0_darwin_amd64.tar.gz"
      sha256 "3b57e3ceb5c191fe06beb31f11ad2b1b61221ab11f2c42673c706c6e2f81bd7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.0/skills-switch_0.9.0_linux_arm64.tar.gz"
      sha256 "9ea145c0706e13418311ad2d73596b9c5ab53080acb675345ac90a49620c8d17"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.9.0/skills-switch_0.9.0_linux_amd64.tar.gz"
      sha256 "33f21d6609557b368327193d0f31fefef3bb5c317570cbc0786b5a7cc617a724"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
