class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.1/rex-amq-adapter_0.11.1_darwin_arm64.tar.gz"
      sha256 "bfebb821cb922aa209e4904368c82994feeccf0db9ede3ba4953d68020327dbe"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.1/rex-amq-adapter_0.11.1_darwin_amd64.tar.gz"
      sha256 "8b98a160dd1705739edb22081ce4543e7eab3cfa87146b3ffde34cd9655e581d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.1/rex-amq-adapter_0.11.1_linux_arm64.tar.gz"
      sha256 "8abdaa876afadcdc8936ed208fe987a1721fe3bc37a221f14a526d3d16884aa8"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.1/rex-amq-adapter_0.11.1_linux_amd64.tar.gz"
      sha256 "cc0379e96c5f4ef34c26e760bd01d7f1f976d0a55ac0fc267edc572d245d2ab7"
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
