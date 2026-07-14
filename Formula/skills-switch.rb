class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.7.0/skills-switch_0.7.0_darwin_arm64.tar.gz"
      sha256 "682b336d08862ea95aa681f89cdea78e3244e3c24dbb0b676aededa22f35737c"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.7.0/skills-switch_0.7.0_darwin_amd64.tar.gz"
      sha256 "c0d67e0c071d77885281524ade78fbb80b4c4b6112922d1aa4b591d684c3a70e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.7.0/skills-switch_0.7.0_linux_arm64.tar.gz"
      sha256 "ae1cffc3311af29ae2e58162b08f85b252d21926521550eb5d27b0cd3ec541eb"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.7.0/skills-switch_0.7.0_linux_amd64.tar.gz"
      sha256 "b4ba843b02a94d49b4c3d38e38713e0cac38973377f68663b7fc80a8c47edd99"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
