class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.10.0/skills-switch_0.10.0_darwin_arm64.tar.gz"
      sha256 "20f34092e2fefad10814b579d545d1067e412d04115bc0885807c77a2667068b"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.10.0/skills-switch_0.10.0_darwin_amd64.tar.gz"
      sha256 "f3c8beb6cdf17fb7b4f502646e68b379678f897f21ee2d307102cc98c15c2c34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.10.0/skills-switch_0.10.0_linux_arm64.tar.gz"
      sha256 "3b30227f6056551b5757607f86d8dd71c9190ba838d14bcf86fcfc6165d50100"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.10.0/skills-switch_0.10.0_linux_amd64.tar.gz"
      sha256 "e863df8fe25fa45b496d7e6c106c4f017bb6c7bac07cf16138ed22fcf081e7c9"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
