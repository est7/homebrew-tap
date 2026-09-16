class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.16.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.16.0/skills-switch_0.16.0_darwin_arm64.tar.gz"
      sha256 "ee78f650e8d527c47611ebf805ffffdfb9be5f00d031fff4b3620c9a9d1b6a71"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.16.0/skills-switch_0.16.0_darwin_amd64.tar.gz"
      sha256 "1dd6cab6e4adff76f5e7436bbf9347b89626bbf66a64d4424cbe529d83ded20f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.16.0/skills-switch_0.16.0_linux_arm64.tar.gz"
      sha256 "ddf0f2e0f98c6c91c865de79f07a139fb1e4a661ff38a1a420a732ebb72aec4f"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.16.0/skills-switch_0.16.0_linux_amd64.tar.gz"
      sha256 "852901eaeb0794e4b297d1869f376aa637b424dc52a4f183fdd518eebfc9daa8"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
