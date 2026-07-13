class SkillsSwitch < Formula
  desc "Manage project-local Agent Skills with an atomic terminal UI"
  homepage "https://github.com/est7/skills-switch-tui"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.1.0/skills-switch_0.1.0_darwin_arm64.tar.gz"
      sha256 "920ebb3eafa371a28e7358a44c97f85dbf91018dab7a98b95019661521a57169"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.1.0/skills-switch_0.1.0_darwin_amd64.tar.gz"
      sha256 "1bf7fc7921170e7cb033de96be8bdc12d328419b385740c2efe3d6ecb38b17d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.1.0/skills-switch_0.1.0_linux_arm64.tar.gz"
      sha256 "92088c845a056c96d7a23a4f7926ad93b0228fe07028ce42d164e39a50b67ee2"
    end

    on_intel do
      url "https://github.com/est7/skills-switch-tui/releases/download/v0.1.0/skills-switch_0.1.0_linux_amd64.tar.gz"
      sha256 "2e24dc3c4d934bd59305f3f75b6f4eab4639327467e5fdb2b34bbff4bcf31aaf"
    end
  end

  def install
    bin.install "skills-switch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills-switch version")
  end
end
