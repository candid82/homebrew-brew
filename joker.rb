class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.17.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.17.1/joker-0.17.1-linux-amd64.zip"
    sha256 "3e4a71408d85f8aa4c3054c6f71d0f277e11e258ba8433ebacb8811c1fbe9ad5"
  else
    url "https://github.com/candid82/joker/releases/download/v0.17.1/joker-0.17.1-mac-amd64.zip"
    sha256 "646bc4e892dec4019b6987ef05089ac5cced6d82d222b9ecca916dca76fcf48c"
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
