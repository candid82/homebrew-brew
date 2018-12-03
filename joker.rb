class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.10.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.10.2/joker-0.10.2-linux-amd64.zip"
    sha256 "174ba5401dc11dbcc3fd5f30c0d820c6d4e1e2702eeaae526626f8248d9e546f"
  else
    url "https://github.com/candid82/joker/releases/download/v0.10.2/joker-0.10.2-mac-amd64.zip"
    sha256 "4059875eb7e93083a2b935132b8b1b08030ff8a55fbb7dc8a284bdf8a90cfe5c"
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
