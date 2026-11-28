class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.31.0/rex-amq-adapter_0.31.0_darwin_arm64.tar.gz"
      sha256 "5ec666d9bf1454646fe87dcd02a0d651cdb45976fe6898f298062382ab5011c2"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.31.0/rex-amq-adapter_0.31.0_darwin_amd64.tar.gz"
      sha256 "4a62291efb641108b7411f3ba40a380058ade19dd2f8663e6dc068ed7f6a9764"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.31.0/rex-amq-adapter_0.31.0_linux_arm64.tar.gz"
      sha256 "67368f257ec4d032833c1cf5471acd6122bf7e266bdf97e323392b1964efb091"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.31.0/rex-amq-adapter_0.31.0_linux_amd64.tar.gz"
      sha256 "805f81b5f70af57f59bee0331ec940a73710a91424f250c5636608084dea77be"
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
