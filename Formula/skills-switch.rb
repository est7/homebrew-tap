class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.13.0/skills-switch_0.13.0_darwin_arm64.tar.gz"
      sha256 "98dffce7bc57f48cb781f199d0495808f50279a431da78240b4bfc314c4697a8"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.13.0/skills-switch_0.13.0_darwin_amd64.tar.gz"
      sha256 "a98ba992fd25182c81d7e58387dca03ccb272c176ec4ca29de20e94e0f6e699d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.13.0/skills-switch_0.13.0_linux_arm64.tar.gz"
      sha256 "22c961157a5eeee7647ebe24420906a8d268e2c5150155075354d3a68475b213"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.13.0/skills-switch_0.13.0_linux_amd64.tar.gz"
      sha256 "0eb24ea39dd1cfbf0a3213b022700be2b47e0652f37006bfa4dbb0288e53aa17"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
