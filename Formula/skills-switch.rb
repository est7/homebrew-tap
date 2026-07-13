class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.1/skills-switch_0.4.1_darwin_arm64.tar.gz"
      sha256 "4e8a9b1b09412f6e0aa4351edb486555d05a25aad6a3666c9f6f0b2780b6572e"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.1/skills-switch_0.4.1_darwin_amd64.tar.gz"
      sha256 "8dba96c5fe4aa3ba11066456fc611b319bb759aa41df07af6c3e7bac8ef78d90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.1/skills-switch_0.4.1_linux_arm64.tar.gz"
      sha256 "e3e1681fd7d816a46eaf08e3c78a19f3db4c4a168e84f64b825deaf84bc61df6"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.4.1/skills-switch_0.4.1_linux_amd64.tar.gz"
      sha256 "0f4f0710c174aa2d2d8262ed2cb43d3bcfa618662c5a31953ab4cccde4502fcb"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
