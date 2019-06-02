class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.4"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.4/joker-0.12.4-linux-amd64.zip"
    sha256 "63968925a330ac9b1a9ea9fbb7b0d70caf203a8373efdf460b300fcf0f410806"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.4/joker-0.12.4-mac-amd64.zip"
    sha256 "9e4934d6e557bf7282c8f2c252f54b66434685b66c32fe98d40ef984654966c3"
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
