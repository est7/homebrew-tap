class RexHistory < Formula
  desc "Rex pane history and coding-agent transcripts in a floating Neovim"
  homepage "https://github.com/est7/rex-history"
  url "https://github.com/est7/rex-history/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7c4eba9c497fcdc6c9fcbbccc1198bac7adf6be811843977e02f407fce8e6e03"
  license "MIT"

  depends_on "neovim"

  def install
    pkgshare.install "init.lua", "view.lua", "transcripts.lua", "tests"
  end

  def caveats
    <<~EOS
      Load it from your Rex init.lua (~/.config/rex/init.lua by default):
        dofile("#{opt_pkgshare}/init.lua").setup()
      then run:
        rex config check && rex config reload
      Cmd+Shift+C opens the focused pane's history.
    EOS
  end

  test do
    system Formula["neovim"].opt_bin/"nvim", "--headless", "-u", "NONE", "-i", "NONE",
           "-l", pkgshare/"tests/run.lua"
  end
end
