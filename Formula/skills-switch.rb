class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.0/skills-switch_0.3.0_darwin_arm64.tar.gz"
      sha256 "d0b629166d3917b12ea5a4873cf6899e13a0beae3e79950a193b3d0b2e5af371"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.0/skills-switch_0.3.0_darwin_amd64.tar.gz"
      sha256 "34ca3cc1553e76c4c56fc94d16af3e53edc99ede4789cdb6b94615c7da8f5829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.0/skills-switch_0.3.0_linux_arm64.tar.gz"
      sha256 "15eb3182ad13fef5b213dae879d3bdb3514fa6a4cebecb412a842ba78888aaf6"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.0/skills-switch_0.3.0_linux_amd64.tar.gz"
      sha256 "2f2c1b6ed872c0e0ba0dc230bd4472d2a3247b1e09d1cbea740c5031bbae9644"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
