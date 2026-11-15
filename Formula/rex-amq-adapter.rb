class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.17.0/rex-amq-adapter_0.17.0_darwin_arm64.tar.gz"
      sha256 "b60447e1ede2b82f0bd3e4d873fa5faf699b24bc52537303b9726873dccbecfb"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.17.0/rex-amq-adapter_0.17.0_darwin_amd64.tar.gz"
      sha256 "f6d0b3d29cc8d204f3f1a00574d42663e4746f3740c2211e55cac6418fb82ae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.17.0/rex-amq-adapter_0.17.0_linux_arm64.tar.gz"
      sha256 "80f83bd8657d531d076220283c941d0d4fa73a1ec5930b9e0f14b5b8994b3c48"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.17.0/rex-amq-adapter_0.17.0_linux_amd64.tar.gz"
      sha256 "8ef236170cc15d96a576c75b76ac2c95378dd10699bd15f2d38a2e45acaa1de9"
    end
  end

  def install
    bin.install "rex-amq-adapter"
  end

  def caveats
    <<~EOS
      Install the skill and hooks for every agent found (Claude Code, Codex,
      Antigravity, Pi):
        rex-amq-adapter setup

      Start Codex with --no-daemon so its hooks and tools inherit the Rex pane environment.
      Codex runs new hooks only after you approve them with /hooks.
      Upgrades keep the hooks and the agent guide current: they run
      #{opt_bin}/rex-amq-adapter. If `rex-amq-adapter status` then reports
      anything outdated (such as the Pi extension), run setup again.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version")
    assert_match "rex-amq-adapter", shell_output("#{bin}/rex-amq-adapter __internal skill")
  end
end
