class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.1/skills-switch_0.3.1_darwin_arm64.tar.gz"
      sha256 "f9f76fefa98ea41b0e6df20ee78e3343d45f0693e4a3c4ac5ab5f72d9819cb97"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.1/skills-switch_0.3.1_darwin_amd64.tar.gz"
      sha256 "0eb5516527bc25294bab11b6a9ea0090f33c1ad92452335acfcd153ec27ca318"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.1/skills-switch_0.3.1_linux_arm64.tar.gz"
      sha256 "206c8c675308c314718c907610ee137fbad4bf567313cde8829b0747acfd8d86"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.3.1/skills-switch_0.3.1_linux_amd64.tar.gz"
      sha256 "c65379e20f3add5fa5b9320bbdfe48e5967fbe53f489499a900467cba82ba924"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
