class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.27.0/rex-amq-adapter_0.27.0_darwin_arm64.tar.gz"
      sha256 "f04f6dcf1befb9430f1045dc69271fee878cdbf8da36a46952b7573a3c150682"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.27.0/rex-amq-adapter_0.27.0_darwin_amd64.tar.gz"
      sha256 "a1ae44e0bf928efc70a7ed72da5404d81d12e6623f0ec3c2437a30b5026e9dbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.27.0/rex-amq-adapter_0.27.0_linux_arm64.tar.gz"
      sha256 "acc5f1559e9690eee6f15be0bd2446f7da0c7191ab2bb54d2a6d926bcf22a85b"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.27.0/rex-amq-adapter_0.27.0_linux_amd64.tar.gz"
      sha256 "f0a0d4f949b9dbe3820cde7ef7e131f4e986ad53527ed510b8832dc9fbd165b1"
    end
  end

  def install
    bin.install "rex-amq-adapter"
  end

  def caveats
    <<~EOS
      Install the skill and hooks for every agent found (Claude Code, Codex,
      Antigravity, Pi):
        rex-amq-adapter install setup

      Start Codex with --no-daemon so its hooks and tools inherit the Rex pane environment.
      Codex runs new hooks only after you approve them with /hooks.
      Upgrades keep the hooks current: they run #{opt_bin}/rex-amq-adapter.
      If `rex-amq-adapter install status` reports anything outdated (such as the
      SKILL.md stubs or Pi extension), run `rex-amq-adapter install setup` again.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version --text")
    assert_match "mail", shell_output("#{bin}/rex-amq-adapter skill list --text")
  end
end
