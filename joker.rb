class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.5.8"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.5.8/joker-linux-amd64.zip"
    sha256 "9d33fee71dada8a5764a88c42b9cca16448694413e4ecec4b58a7440589806c7"
  else
    url "https://github.com/candid82/joker/releases/download/v1.5.8/joker-mac-amd64.zip"
    sha256 "b49f28c88bb6a1ca916efef8a35a9482ead4693b1adb8e9c62288c5ca516eb44"
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
