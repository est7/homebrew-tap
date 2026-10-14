class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.17.0/skills-switch_0.17.0_darwin_arm64.tar.gz"
      sha256 "6946977970168a6185103e7640bb4185663cd47091a2a30ff8c38eb2d10a8681"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.17.0/skills-switch_0.17.0_darwin_amd64.tar.gz"
      sha256 "2bcee697c564a0a75111581223f8f3ffe03da3d52923754dcca1feec6af4d129"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.17.0/skills-switch_0.17.0_linux_arm64.tar.gz"
      sha256 "04c8899b1a08b35ff2ddcf1fd2af8f51d9d02bb88bbb3ce0623caeaae742d86c"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.17.0/skills-switch_0.17.0_linux_amd64.tar.gz"
      sha256 "eb14704e7ebeb68fb5511738fd66e902e69d86b981133ee7e3514e67618b0e2a"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
