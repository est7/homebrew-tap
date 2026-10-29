class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.2.0/rex-amq-adapter_0.2.0_darwin_arm64.tar.gz"
      sha256 "d839cf46db98849b47717794a8f2059f4de979b5662e5fdf3097dc3ada099752"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.2.0/rex-amq-adapter_0.2.0_darwin_amd64.tar.gz"
      sha256 "32c104c3d3d93aee62e3a0a3a13f672ed55a1ab2ec4d34eade70623eb7c9c7e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.2.0/rex-amq-adapter_0.2.0_linux_arm64.tar.gz"
      sha256 "c750752798dfc7cb10ef7bd16b8bf66192a7c94e6a7810afa85b346f5ae54782"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.2.0/rex-amq-adapter_0.2.0_linux_amd64.tar.gz"
      sha256 "85517753ace409a2bb7b68d7fb8a8024101dfbb63c773b80aea0b9effbc848ae"
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
      Upgrades need no second setup: the hooks run #{opt_bin}/rex-amq-adapter.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version")
    assert_match "rex-amq-adapter", shell_output("#{bin}/rex-amq-adapter __internal skill")
  end
end
