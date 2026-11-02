class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.0/rex-amq-adapter_0.5.0_darwin_arm64.tar.gz"
      sha256 "c289795ef19ccd8c8ab554ad88df32c1c570bb40cf313c9451bab5399aeafe0d"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.0/rex-amq-adapter_0.5.0_darwin_amd64.tar.gz"
      sha256 "4bf4063145ad58435a98453613d2c0d0d601190efbc3fcbc19981093bed688cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.0/rex-amq-adapter_0.5.0_linux_arm64.tar.gz"
      sha256 "24bc8e18fe0dd9ef6f4e7dbffa71c4e373751d6d61bd6afad9e34c91946c01b9"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.0/rex-amq-adapter_0.5.0_linux_amd64.tar.gz"
      sha256 "d09a46e4b05604d5a7655c6d8e0e206518960f9aa8606277a28579058d02178d"
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
