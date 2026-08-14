class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.0/skills-switch_0.15.0_darwin_arm64.tar.gz"
      sha256 "a053f43891402549615a78ba118e2415a2fd35a8a5fe0d18e1172e503c21aa00"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.0/skills-switch_0.15.0_darwin_amd64.tar.gz"
      sha256 "335043e12925aeeed8699705bb1720c4ecf8e5f6d3a209a496afb2f35e3c2cde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.0/skills-switch_0.15.0_linux_arm64.tar.gz"
      sha256 "b2ea2a7ec547967a509cca51c03f30b93671f00628f57823be1f34b2cf5738ce"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.0/skills-switch_0.15.0_linux_amd64.tar.gz"
      sha256 "e9260e897950fe9724c883fdf6a9d62b5c5ff02a722c8a0ce6df1d74229b1081"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
