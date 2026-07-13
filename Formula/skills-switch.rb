class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.6.0/skills-switch_0.6.0_darwin_arm64.tar.gz"
      sha256 "a287a560ef8e738f49cf3e194f24532bd9e169db303eee2355ecd9fe8e4c652c"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.6.0/skills-switch_0.6.0_darwin_amd64.tar.gz"
      sha256 "b2ae0e692669cf8e92e8073ddfb1a10586d4d8b15255d65991f4e8fffae130a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.6.0/skills-switch_0.6.0_linux_arm64.tar.gz"
      sha256 "fd194420a9d5654979afde4fcef18a25f2a561a3554fa67ab24516a0dc05c9d8"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.6.0/skills-switch_0.6.0_linux_amd64.tar.gz"
      sha256 "3c9777920417cd908adfbc395118989a93c1d1fcb178468133c474e255bf1a72"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
