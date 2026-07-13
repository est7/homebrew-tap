class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.2.0/skills-switch_0.2.0_darwin_arm64.tar.gz"
      sha256 "39a801dcba0f2d913de37f26a65ad0e3cdbf17919f3b704cde13ded68e9ca140"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.2.0/skills-switch_0.2.0_darwin_amd64.tar.gz"
      sha256 "4ed4ca8ecdf8a2780a56a849eb8ae9869c31203231e117a07373fc98dae6085b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.2.0/skills-switch_0.2.0_linux_arm64.tar.gz"
      sha256 "063236b229f95abb1a1794dab2c3a7cbd3f3c84e92a0e4b3736644e49ab3b7b1"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.2.0/skills-switch_0.2.0_linux_amd64.tar.gz"
      sha256 "1098453f60e0f3187990995ac9574f11016759ac2ebd03c576ca3568510fe86d"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
