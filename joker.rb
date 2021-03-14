class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.16.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.16.0/joker-0.16.0-linux-amd64.zip"
    sha256 "e6d342b88ca7a30353d09625bcbc75eb07d02399f8fc3fe0d0632f913b0f009f"
  else
    url "https://github.com/candid82/joker/releases/download/v0.16.0/joker-0.16.0-mac-amd64.zip"
    sha256 "c8ff463b0b5219604a13e5e3ca44889b1be49884657c4f4f8ed2343b86bf1420"
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
