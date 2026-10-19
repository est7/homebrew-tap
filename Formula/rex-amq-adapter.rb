class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.0/rex-amq-adapter_0.1.0_darwin_arm64.tar.gz"
      sha256 "f03215d655226e51b5c7b8c8c3907af90ca9eef7cc2892aae700a68a1415b426"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.0/rex-amq-adapter_0.1.0_darwin_amd64.tar.gz"
      sha256 "f2846a5f92227769abe009eda2b10f444b494290eb46571c43f1ba4b515bb0c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.0/rex-amq-adapter_0.1.0_linux_arm64.tar.gz"
      sha256 "eaf5ee413d8a59727bfbf21812ca621de7488971c311a8a0c19caa4e734a7547"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.0/rex-amq-adapter_0.1.0_linux_amd64.tar.gz"
      sha256 "355eb320135a16a0b87980ecb709ea92ba1e85148abcde8d5f11f531abc7ca68"
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
