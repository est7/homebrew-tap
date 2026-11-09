class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.7/rex-amq-adapter_0.9.7_darwin_arm64.tar.gz"
      sha256 "2a00d9189fa764a72ce547b362924cce62bbfe35c5e0e3ee3ff464e50ddd2035"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.7/rex-amq-adapter_0.9.7_darwin_amd64.tar.gz"
      sha256 "c677ccc28bafffcf9cb7299a1dac2efb8ed92e8032ad57cc67a73a8412efecbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.7/rex-amq-adapter_0.9.7_linux_arm64.tar.gz"
      sha256 "409861b36bef9de4be17999c3d77908c0a9e0f7e9f81af95f7860eb8bed6d94e"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.7/rex-amq-adapter_0.9.7_linux_amd64.tar.gz"
      sha256 "fec144d5d9de35eef3a62a4169b5f27f19fe09fde4c36d5b77c6f49e6fa99a21"
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
