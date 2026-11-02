class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.1/rex-amq-adapter_0.4.1_darwin_arm64.tar.gz"
      sha256 "d313e79ebb378b82108558aad9a3b23afd72219d490cbdbab5903bd9cbb3aa22"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.1/rex-amq-adapter_0.4.1_darwin_amd64.tar.gz"
      sha256 "b9c60e7e266f1b603ede26680712659c3b34abb85ceef83c9a2e9c3382d32e15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.1/rex-amq-adapter_0.4.1_linux_arm64.tar.gz"
      sha256 "424d2c86c052e418c213981951234952e81b1a7344a919719f07544ac7c17f1e"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.1/rex-amq-adapter_0.4.1_linux_amd64.tar.gz"
      sha256 "2d5f6f6bd34214c298b14a95a4e558da61a713e2c663f86b65f9f1508ee5bb2d"
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
