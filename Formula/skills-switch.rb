class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.18.2"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.2/skills-switch_0.18.2_darwin_arm64.tar.gz"
      sha256 "dbd25710a805c3e93c93fdb2b5d9b3148442174360e5a269842109b4be71fceb"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.2/skills-switch_0.18.2_darwin_amd64.tar.gz"
      sha256 "2b436532ab5167617bb1b76663a6762b35bdfec00fd9632dcd1a084989ce6d33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.2/skills-switch_0.18.2_linux_arm64.tar.gz"
      sha256 "9deece5185caf19105bd5c4102538a2c37ecc90fc6958884f8c0777592fe9ec1"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.18.2/skills-switch_0.18.2_linux_amd64.tar.gz"
      sha256 "139566a9882833ee917f4ec8daa1df51fd39d2b723f168bdcad3d69e7ae35c9f"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
