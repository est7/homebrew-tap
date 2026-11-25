class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.20.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.20.0/skills-switch_0.20.0_darwin_arm64.tar.gz"
      sha256 "34e3d9bffefc54db94d58d10d60e8e3990be30be7c91aff0de2dfcfd191cf73a"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.20.0/skills-switch_0.20.0_darwin_amd64.tar.gz"
      sha256 "55ba2f7dd504d5c3df203b06d420a7f2d1a8ec6dc8fa86674df8bc9bbae3340e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.20.0/skills-switch_0.20.0_linux_arm64.tar.gz"
      sha256 "45b4f24aca6f6127a89e9727ac87acb3fcb1850c488c604938dfae4e00340c2b"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.20.0/skills-switch_0.20.0_linux_amd64.tar.gz"
      sha256 "222871d2de02fbd6777f5715f8ea475456fcea8f622e1fbc3e49e1cda65334d8"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
