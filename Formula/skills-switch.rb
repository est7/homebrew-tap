class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.14.0/skills-switch_0.14.0_darwin_arm64.tar.gz"
      sha256 "2c1936af28a4491449feeef58e105c2a388df2520c09164e4b81469955eb5847"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.14.0/skills-switch_0.14.0_darwin_amd64.tar.gz"
      sha256 "6acde7097d2b4ccba24004e5c272576b890a4c0a7c20ae7b6800632b835a1c2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.14.0/skills-switch_0.14.0_linux_arm64.tar.gz"
      sha256 "6b9f4639c3f65ef57d585e6f9f3a337385b7bf17616d5f183fb5e1f96ee17c84"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.14.0/skills-switch_0.14.0_linux_amd64.tar.gz"
      sha256 "d282fe71fabc59b48c354a605dd0d9e563541a2e3f5a955a2050faf7ac4d9681"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
