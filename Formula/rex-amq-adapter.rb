class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.2/rex-amq-adapter_0.25.2_darwin_arm64.tar.gz"
      sha256 "9b0c8371046fef3c2b6aea794b49abc986c2a383882472d5718e6ab3a9b8ab59"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.2/rex-amq-adapter_0.25.2_darwin_amd64.tar.gz"
      sha256 "c07ca522f12c795a6b340c9b7313e2ab67ba1c1f05ac6ba29dd6c11cd241aaf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.2/rex-amq-adapter_0.25.2_linux_arm64.tar.gz"
      sha256 "646cd9779aacde811384aeb8e6dcaf01358a77aaf64fe47ba5cf109bb61c5687"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.2/rex-amq-adapter_0.25.2_linux_amd64.tar.gz"
      sha256 "367f9d156bebf8ca8e3e3ed20b6628706637ba5cd124ad53659ea7e0a7072883"
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
