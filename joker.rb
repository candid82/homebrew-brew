class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.3"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.3/joker-0.12.3-linux-amd64.zip"
    sha256 "78fdf9ea7295aea243de840654745cb823dd9ff3b859dbfae74fa9d6ce2c2144"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.3/joker-0.12.3-mac-amd64.zip"
    sha256 "17e6861b98943fbf879b99f2254d2eea40bcb42838170736ff930fba068ba8d0"
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
