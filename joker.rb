class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.17.3"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.17.3/joker-0.17.3-linux-amd64.zip"
    sha256 "f5f40776bb97d43c91993cd59a4531f28af019afaf185c0b0b300410e60fbb19"
  else
    url "https://github.com/candid82/joker/releases/download/v0.17.3/joker-0.17.3-mac-amd64.zip"
    sha256 "62af7a3222c03f4e415b6fe5a0f3bf8aca454d21e51642044b7f4cd2f52493b0"
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
