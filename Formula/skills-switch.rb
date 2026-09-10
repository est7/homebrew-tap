class SkillsSwitch < Formula
  desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.15.2"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.2/skills-switch_0.15.2_darwin_arm64.tar.gz"
      sha256 "e40e8a00a09da5117b4b39927cfb3a57087fa4c755ab8017b81612f85c7ca5a6"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.2/skills-switch_0.15.2_darwin_amd64.tar.gz"
      sha256 "705dc08b63aeaca4c5450142168e91ef5bdf7b9f42cc466c167ebd62ecc17b14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.2/skills-switch_0.15.2_linux_arm64.tar.gz"
      sha256 "418be1367c9c58d75cb232d87b3d6ffa65c4d498fcefaaaa7d0cd2e268e42f96"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.15.2/skills-switch_0.15.2_linux_amd64.tar.gz"
      sha256 "7ed9602183128eb701739a75f9d596adcb51c8ab60293274a3cbd82b828e4705"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
