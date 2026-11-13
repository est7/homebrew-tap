class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.1/rex-amq-adapter_0.14.1_darwin_arm64.tar.gz"
      sha256 "70c7ff7cbaf52cb428c17af3675b0192c07484079cb634f30c8dde5f9810234e"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.1/rex-amq-adapter_0.14.1_darwin_amd64.tar.gz"
      sha256 "549d2d78baf4f3efdf5ba7b2ee8ffa247a9c05abdc1a2c901cbfd30068be591e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.1/rex-amq-adapter_0.14.1_linux_arm64.tar.gz"
      sha256 "7e2656527d219c15ae0b2fea758012ceff08d03e80179a3d868a00a4d8719cbf"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.1/rex-amq-adapter_0.14.1_linux_amd64.tar.gz"
      sha256 "c92f945b2e6c5d27cb48a7689af251df5b93728b8a27d848edc4bbe7824c45a6"
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
