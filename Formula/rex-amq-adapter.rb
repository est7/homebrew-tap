class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.0/rex-amq-adapter_0.23.0_darwin_arm64.tar.gz"
      sha256 "7308150e19da5e368c2905766a67cdcb60da50c2b33d0b409ee44ed98bf79d9b"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.0/rex-amq-adapter_0.23.0_darwin_amd64.tar.gz"
      sha256 "c14c104701d7255fbf131bdb47b8b07b73c50db6bfab498e3204a8e21822de70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.0/rex-amq-adapter_0.23.0_linux_arm64.tar.gz"
      sha256 "6af2d47738507f0c186b8c2c034c64f4064f606efb29dbee9f9f58e93cfa6862"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.23.0/rex-amq-adapter_0.23.0_linux_amd64.tar.gz"
      sha256 "46d265becbebeea7f29f799c2171d1028ed47aa845ad22b139e489188fb178de"
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
