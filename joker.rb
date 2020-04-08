class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.3"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.3/joker-0.15.3-linux-amd64.zip"
    sha256 "2cd9764128c09540101b998a2ddd8279db7e6db6986a4e1d2d30f8809fff2e28"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.3/joker-0.15.3-mac-amd64.zip"
    sha256 "da167d7d8767a6a69748ed3eb5e481312f3ed0751f997b566caf6493c533d632"
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
