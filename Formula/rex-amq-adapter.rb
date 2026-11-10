class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.2/rex-amq-adapter_0.11.2_darwin_arm64.tar.gz"
      sha256 "ede6ce2c7eade86cda575010ddf8f4e92bc13904f60180e9a64273bacdae8b40"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.2/rex-amq-adapter_0.11.2_darwin_amd64.tar.gz"
      sha256 "976854aa30d9a12def4a18c38b6c0f9b4bbb2cb6518f390900a1a3ff65204e5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.2/rex-amq-adapter_0.11.2_linux_arm64.tar.gz"
      sha256 "0c41bc4cdbf8c5b6905e274a7070c98980c41de3848d4b23e97307c6de120781"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.2/rex-amq-adapter_0.11.2_linux_amd64.tar.gz"
      sha256 "6b90807a1a81a57e2c93cc432bacb9bda804c5090893e9972fbea2fd6f420066"
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
