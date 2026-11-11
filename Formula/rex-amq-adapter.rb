class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.3/rex-amq-adapter_0.11.3_darwin_arm64.tar.gz"
      sha256 "f2fe8441522629b9eafda3de4e0c380dc8a8d90530b7b715eb3820660f17a049"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.3/rex-amq-adapter_0.11.3_darwin_amd64.tar.gz"
      sha256 "03774c87c634be0c3939585d07208da2decf4d03de44e9a5a73f0daf0f4d456e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.3/rex-amq-adapter_0.11.3_linux_arm64.tar.gz"
      sha256 "19ff8db2564754c1af892881b2f6530cd0fec4df8d25f34217cb71e26a7e232f"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.3/rex-amq-adapter_0.11.3_linux_amd64.tar.gz"
      sha256 "1875204edece8ca3b1c886db6969eee48963f99ba77677ff41aa628d3764b07c"
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
