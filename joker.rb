class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.6"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.6/joker-0.12.6-linux-amd64.zip"
    sha256 "b42c3b125132692966fe82c7a9b80936f1727256b6d50c675e8e5358d5d9155e"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.6/joker-0.12.6-mac-amd64.zip"
    sha256 "1de828dad39250117645bb84eead66b2714b445fb9c3850936ea2b384d801c61"
  end

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(let [x 1] (println 42))"

    assert_match "Parse warning: unused binding: x",
      shell_output("#{bin}/joker --lint --dialect clj #{testfile} 2>&1")
  end
end
