class RexAmqUi < Formula
  desc "Floating Crew and Epics cockpit panel for Rex sessions over AMQ"
  homepage "https://github.com/est7/rex-amq-ui"
  license "MIT"

  depends_on "est7/tap/rex-amq-adapter"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.3.0/rex-amq-ui_0.3.0_darwin_arm64.tar.gz"
      sha256 "7df879fa3216d1c40e819cffdebc1b85a52b9895bfaee443bc16286998a67063"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.3.0/rex-amq-ui_0.3.0_darwin_amd64.tar.gz"
      sha256 "0e4c9aecf407b5d3266306676538d8dc3ff7b36ba2b04d288157760622f5a813"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.3.0/rex-amq-ui_0.3.0_linux_arm64.tar.gz"
      sha256 "21dba90b14fc5615d6211d03da4815d539075d6fe7cb82d99f524a6e2d7c472b"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.3.0/rex-amq-ui_0.3.0_linux_amd64.tar.gz"
      sha256 "404631d3b2556a7bc372aeb6e50432233d51efc6f8a541899cabe9348b6d1a2e"
    end
  end

  def install
    bin.install "rex-amq-ui"
    pkgshare.install "lua/rex-amq-ui/init.lua", "lua/rex-amq-ui/tests"
  end

  def caveats
    <<~EOS
      Load the plugin from your Rex init.lua (~/.config/rex/init.lua by default):
        dofile("#{opt_pkgshare}/init.lua").setup{ toggle_key = "cmd+shift+a", waiting_key = "cmd+shift+u" }
      then run:
        rex config check && rex config reload
      Cmd+Shift+A toggles the floating panel; Cmd+Shift+U jumps to the agent waiting on you.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-ui --version")
    assert_predicate pkgshare/"init.lua", :exist?
  end
end
