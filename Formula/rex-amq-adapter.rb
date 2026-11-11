class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.5/rex-amq-adapter_0.11.5_darwin_arm64.tar.gz"
      sha256 "a1546d2dd0474e2a4a3db851b098eb585d4867c9eaa63bebb81b4984b93f5fd9"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.5/rex-amq-adapter_0.11.5_darwin_amd64.tar.gz"
      sha256 "e353803e7cb7e0d5d9354eae4fa414473269b1c05271c2c08f0c22694e9a4470"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.5/rex-amq-adapter_0.11.5_linux_arm64.tar.gz"
      sha256 "fcac9a80afcfb8a5706ad5d366363f5628d35e294306b9df0f212b7fd51a2f78"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.5/rex-amq-adapter_0.11.5_linux_amd64.tar.gz"
      sha256 "e1e15a625e49a9b4863e2a34f2092d8ee1ff7b3d993521f16386a8905cca1f5d"
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
