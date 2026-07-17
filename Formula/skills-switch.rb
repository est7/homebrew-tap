class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.12.2"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.2/skills-switch_0.12.2_darwin_arm64.tar.gz"
      sha256 "ce326b353bb5a01e8657c6f2514c9b21339f4c4193db7d302f1cb682db83537e"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.2/skills-switch_0.12.2_darwin_amd64.tar.gz"
      sha256 "fb0f80c61a8f98980675514b0f9fe185b2b1f75d04db00cc6dddb7d36bfbd731"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.2/skills-switch_0.12.2_linux_arm64.tar.gz"
      sha256 "d77a234b7b4ef83a3a7506dfe6ce1d3bb952b40703fb1b5cfe33cc1236dffe8e"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.12.2/skills-switch_0.12.2_linux_amd64.tar.gz"
      sha256 "5f8bb905d796000bbdbd37e270b587248fdcb968631dc2b921ff68527df6f55c"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
