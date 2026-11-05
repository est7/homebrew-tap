class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.6.0/rex-amq-adapter_0.6.0_darwin_arm64.tar.gz"
      sha256 "da9dc74e30ac864ce16febb1340f24c03e22c71081bced501dc3b584ee8c1372"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.6.0/rex-amq-adapter_0.6.0_darwin_amd64.tar.gz"
      sha256 "b36c3aa0502f86ab914c8251872b6d8df103545657be29cbd0eeba331a064c93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.6.0/rex-amq-adapter_0.6.0_linux_arm64.tar.gz"
      sha256 "9cb19463847d275b139d3ba93e21a88737efff43efeb3404fdafe01580b2cc97"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.6.0/rex-amq-adapter_0.6.0_linux_amd64.tar.gz"
      sha256 "6df97b6b98268dd35eb4d7c3af3de308f2b3a2df192c2631b6900b0e14f25b2f"
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
