class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.4.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.4.1/joker-linux-amd64.zip"
    sha256 "3afc8958540ebc1f70f3ab8877541218a19101b570df73dfa1ac9d114b548125"
  else
    url "https://github.com/candid82/joker/releases/download/v1.4.1/joker-mac-amd64.zip"
    sha256 "fbc2088db711f3a506f6accda8e1be5f69a1f2fc75f27decefec3689bc152d07"
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
