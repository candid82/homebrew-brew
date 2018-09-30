class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.10.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.10.0/joker-0.10.0-linux-amd64.zip"
    sha256 "853856ef956a8828a412600619c1f96141ce254fc4165931d6f5d43405e9c667"
  else
    url "https://github.com/candid82/joker/releases/download/v0.10.0/joker-0.10.0-mac-amd64.zip"
    sha256 "8bc9808c9e170740dd073e3bede2fc7ca101fce36684d98e5cb4343d5fc68cfc"
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
