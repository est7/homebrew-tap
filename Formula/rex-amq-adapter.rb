class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.0/rex-amq-adapter_0.4.0_darwin_arm64.tar.gz"
      sha256 "e8ca896f26ff820387f30334ab3bbd1e7bae012b6b3399bb662e4dd5f89c87be"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.0/rex-amq-adapter_0.4.0_darwin_amd64.tar.gz"
      sha256 "534d379293db9206204bd026e45410b5e621a906963b281a5af5ced8137322c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.0/rex-amq-adapter_0.4.0_linux_arm64.tar.gz"
      sha256 "dac796f111d6d446f9f0b83cb016c60720028faaf3561e7b2933a67dfcfcea65"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.0/rex-amq-adapter_0.4.0_linux_amd64.tar.gz"
      sha256 "6f453ad8c788b90a7e0ea8406f1fdd21086219e8124ebdec5b751ac94f33870d"
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
