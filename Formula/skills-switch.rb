class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.18.3"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.3/skills-switch_0.18.3_darwin_arm64.tar.gz"
      sha256 "2397014349cfe7041d462e60f13ffe3914f9712a6a60decc0051e4ee61b8224c"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.3/skills-switch_0.18.3_darwin_amd64.tar.gz"
      sha256 "c705e36338b629ab935211dc728d2b7d023cd22c2732592c88ead4e9ec52fa3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.3/skills-switch_0.18.3_linux_arm64.tar.gz"
      sha256 "2c18a82b62a357f74f52e71b1cb792c9592e61a34baee0894d63dc41f05f5b59"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.3/skills-switch_0.18.3_linux_amd64.tar.gz"
      sha256 "21474e626d9d9c702cae0908df8c6e9a6b1e47fe1990c2f639e4d5cc89a3c623"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
