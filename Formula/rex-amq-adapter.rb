class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.21.0/rex-amq-adapter_0.21.0_darwin_arm64.tar.gz"
      sha256 "eb548069d39a6416a5fbdcdc43bf0e3a9dd878e77961a123207a2ba93a4572b1"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.21.0/rex-amq-adapter_0.21.0_darwin_amd64.tar.gz"
      sha256 "7a52abcc9120e103a80dece81bef7b9824eaa114fa7d5c3fae5b0d470e3ffa27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.21.0/rex-amq-adapter_0.21.0_linux_arm64.tar.gz"
      sha256 "d5a830a16dc4c57b6b9a046691fe3ba3ca403a7bff736c31d408bb1b2dff1248"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.21.0/rex-amq-adapter_0.21.0_linux_amd64.tar.gz"
      sha256 "2684dfe2bec93358f67c57b8dfb2c4a5c47a17a4870bab7529538b22201ebf60"
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
