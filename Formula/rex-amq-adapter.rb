class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.13/rex-amq-adapter_0.9.13_darwin_arm64.tar.gz"
      sha256 "f71b87c0b4e5109c383a3d257f348e01eff5739fe5b3055c6d81f619733adf6c"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.13/rex-amq-adapter_0.9.13_darwin_amd64.tar.gz"
      sha256 "63f390b4f13ce9579c072c7adbe47efedd7d669bf51e0c89e76e214b825499d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.13/rex-amq-adapter_0.9.13_linux_arm64.tar.gz"
      sha256 "369f83479f050d41e9bc7117b7e31c7de573590ab0c703644c12281c74a7f3d4"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.13/rex-amq-adapter_0.9.13_linux_amd64.tar.gz"
      sha256 "42b9147a60b07c1ffceedf0be15a4db293e02c63c26bdffdf900af431e30203a"
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
