class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.1/skills-switch_0.12.1_darwin_arm64.tar.gz"
      sha256 "c8bcf71e759b33cdc67afffa5a9ebec4904ee71eca21fb852c911f01fb611b16"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.1/skills-switch_0.12.1_darwin_amd64.tar.gz"
      sha256 "b9af4d050e8abc7330a8303ea84692975da4d24ab133d35a0942e7ae5c598c2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.1/skills-switch_0.12.1_linux_arm64.tar.gz"
      sha256 "83b926b5c28d2aaae752d14d9bc3d1b430423589420df6731b2f9182c155a18d"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.1/skills-switch_0.12.1_linux_amd64.tar.gz"
      sha256 "f6cd831fe22243a6b11da01fb175f871b3f5c1c5be14f8b1a1c34739cf65a414"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
