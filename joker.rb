class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.3"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.3/joker-0.9.3-linux-amd64.zip"
    sha256 "423730e0a04ce7c20d89565f8afbd256d0a0deee5dd116d5120a22cb09cf4754"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.3/joker-0.9.3-mac-amd64.zip"
    sha256 "6e13e4d8aed7a43279c0c7ca42400e7a56424bbf4165397834443600ee81b1d0"
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
