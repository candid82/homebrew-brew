class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.2/joker-0.15.2-linux-amd64.zip"
    sha256 "bfc452efbc61193a08b60ffd5c239a32edc4df857f42266374714f3b883de98a"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.2/joker-0.15.2-mac-amd64.zip"
    sha256 "9dc8b18de7dfea4d49db36a02e546460adfc3320a2d034f404b3f207f9422317"
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
