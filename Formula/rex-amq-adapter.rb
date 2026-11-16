class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.22.0/rex-amq-adapter_0.22.0_darwin_arm64.tar.gz"
      sha256 "da3653501f38a704906d9ab0069d0751a815f17ee9cd632e2630821059e40d5b"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.22.0/rex-amq-adapter_0.22.0_darwin_amd64.tar.gz"
      sha256 "f6d11edfa66c6c5103f0df314974282dbe8172e07d21fc119ab5754bf3d43598"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.22.0/rex-amq-adapter_0.22.0_linux_arm64.tar.gz"
      sha256 "cdb19cb14c8fc936bbc7ed1d9583efe93bc65462b2aa38fd5485c36cb9c596fd"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.22.0/rex-amq-adapter_0.22.0_linux_amd64.tar.gz"
      sha256 "750e8f92f757b226dec7b9bdada93e4f1175575c897f5aeb0356cf7863352700"
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
