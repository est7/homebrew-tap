class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.1/rex-amq-adapter_0.1.1_darwin_arm64.tar.gz"
      sha256 "8eeb4dc9a08be8789355eba30127bcfc0e829160a8ed5fc6bb3650495da8c1f9"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.1/rex-amq-adapter_0.1.1_darwin_amd64.tar.gz"
      sha256 "a386d97c7aa5bb771ee1cbe7ade27969772dc487c7fb6227ed93a7f648b19e1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.1/rex-amq-adapter_0.1.1_linux_arm64.tar.gz"
      sha256 "6cad9f264650b94df93612b8beb31fd85593d29fc452adaa4e83cffe5cf980f7"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.1/rex-amq-adapter_0.1.1_linux_amd64.tar.gz"
      sha256 "47d16bdc497509cd946d289eb1b4b620cbde003ad19754e4be9f36289cdc4c84"
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

      Codex runs new hooks only after you approve them with /hooks.
      Upgrades need no second setup: the hooks run #{opt_bin}/rex-amq-adapter.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version")
    assert_match "rex-amq-adapter", shell_output("#{bin}/rex-amq-adapter __internal skill")
  end
end
