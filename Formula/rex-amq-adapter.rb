class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.1/rex-amq-adapter_0.23.1_darwin_arm64.tar.gz"
      sha256 "5ff4ed5638f3b18974a35a40804892b98bab04aeb9bfb4db6e398d2844d5c868"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.1/rex-amq-adapter_0.23.1_darwin_amd64.tar.gz"
      sha256 "02d4e2dcd62e57964016475086d0bf629752c260173417e6be11714af779a81f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.1/rex-amq-adapter_0.23.1_linux_arm64.tar.gz"
      sha256 "4a179050c3d6a919f9d48582f634700db4efbe7cc8ef70107c4a308d5cd50a07"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.1/rex-amq-adapter_0.23.1_linux_amd64.tar.gz"
      sha256 "2b23b4576677af3088c04cc361f207546eef14a7094c01cfd4d8bb81629887cb"
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
