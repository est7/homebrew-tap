class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.15.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.1/skills-switch_0.15.1_darwin_arm64.tar.gz"
      sha256 "2f44829a4a4783a0c52c0a43719a014e889f1b9307fd743ffb1080a4e7573969"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.1/skills-switch_0.15.1_darwin_amd64.tar.gz"
      sha256 "2739518f3eb76c315218ec7f1c91e25b54be635f5d452a7c5a4ec821bee26a5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.1/skills-switch_0.15.1_linux_arm64.tar.gz"
      sha256 "be703bae6a324f94e57c222d3efddad135f7ca2d23561a35e8d3baac82e4e189"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.1/skills-switch_0.15.1_linux_amd64.tar.gz"
      sha256 "ce2ce43b6f632b329f740fe2c4c83200d5fea37f5af8cab8f80b163eed111e31"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
