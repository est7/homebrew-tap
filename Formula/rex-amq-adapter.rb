class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.4/rex-amq-adapter_0.11.4_darwin_arm64.tar.gz"
      sha256 "213bd8a02c2712472ebabb4b3d2cecc099793f4b8abac00393afd5089a855748"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.4/rex-amq-adapter_0.11.4_darwin_amd64.tar.gz"
      sha256 "f4129d07b4483583eca6d0fd62574643d57d7125da9e1b4abb0ba5664150e24e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.4/rex-amq-adapter_0.11.4_linux_arm64.tar.gz"
      sha256 "caaf1c238cb61c8087e80a5be58fa37be780aae4852f0f20fae33f2a9f684115"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.4/rex-amq-adapter_0.11.4_linux_amd64.tar.gz"
      sha256 "9387c60fb6551f615008da4a71e73a17817d17cedced0177d08e2ce9b6d50f7e"
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
