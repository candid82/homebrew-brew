class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.4.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.4.0/joker-linux-amd64.zip"
    sha256 "c38458e7933e23b41c0d978a1fe3c20de5c7c1970a28c4ec5e0d43440e80b92b"
  else
    url "https://github.com/candid82/joker/releases/download/v1.4.0/joker-mac-amd64.zip"
    sha256 "735c52387f08eab6aaa87c690c8c2f3a836ce069fb5c2d63081920350d636f63"
  end

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
