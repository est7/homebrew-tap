class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.0/skills-switch_0.18.0_darwin_arm64.tar.gz"
      sha256 "0ccf6fe2fd31d9cede64691cd6c0b227966bd6432c7580554911cf9a7854beef"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.0/skills-switch_0.18.0_darwin_amd64.tar.gz"
      sha256 "49faf77b753f9ba4ff0095eeb059ceb6320d9896da19ebb25fa277af69a3f6d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.0/skills-switch_0.18.0_linux_arm64.tar.gz"
      sha256 "1e0f55240a65792fc2cc6a9f11ea523c168ccd4ed75856f385393967c5fce52c"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.0/skills-switch_0.18.0_linux_amd64.tar.gz"
      sha256 "973c1818ea6124136df39ebcff54b7eb1643c297c4182cfaa6164b86722a422f"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
