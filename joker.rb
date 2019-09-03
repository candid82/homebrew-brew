class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.7"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.7/joker-0.12.7-linux-amd64.zip"
    sha256 "25ba334d68044971e556e9aa0ce6c1994610a464c399adf0e0357fd2e23b6c36"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.7/joker-0.12.7-mac-amd64.zip"
    sha256 "07a1325310cb6d48f8a5a57ea621b1db2a292cae8f338d20375b15982b42d7b7"
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
