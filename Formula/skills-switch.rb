class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.19.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.19.0/skills-switch_0.19.0_darwin_arm64.tar.gz"
      sha256 "4aa7f45150601b85f015458df0f77d6418ffa236f6808f9ef837bb8c53f58863"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.19.0/skills-switch_0.19.0_darwin_amd64.tar.gz"
      sha256 "664fd1c077067f86207e75841ff423dd3905f4300d2554545ba2d7a4b401c073"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.19.0/skills-switch_0.19.0_linux_arm64.tar.gz"
      sha256 "88007ecbd66df61514c816fc554051a79720491f3578283e0d45c0e183968a48"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.19.0/skills-switch_0.19.0_linux_amd64.tar.gz"
      sha256 "c5b217114e70ebcb1f2657501ed3c946cfd216b996aab6e3a25ad3abbc2637db"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
