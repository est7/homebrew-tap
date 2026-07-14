class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.8.0/skills-switch_0.8.0_darwin_arm64.tar.gz"
      sha256 "f82ef404b2b66cb5262f372f03ea93657c981657017e06b8056e2fa3f0634f83"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.8.0/skills-switch_0.8.0_darwin_amd64.tar.gz"
      sha256 "1d8e673b8863dd71a1b56d870e90ccf813e2b34f398c225c5b34d5ca9318b147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.8.0/skills-switch_0.8.0_linux_arm64.tar.gz"
      sha256 "3f513f9c88a032aa1239b749b7b766ac70da516473fb5ab5170070369fb22bf9"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.8.0/skills-switch_0.8.0_linux_amd64.tar.gz"
      sha256 "53a6c422d1925f2104e82827afe757df66fe5b59e324d7444f96ac912607ccb7"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
