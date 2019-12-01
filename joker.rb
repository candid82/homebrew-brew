class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.14.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.14.0/joker-0.14.0-linux-amd64.zip"
    sha256 "c5847fcaf0f24e567833ab6784ff7e7597f36577a3f350eaa9ec3f3b57703efe"
  else
    url "https://github.com/candid82/joker/releases/download/v0.14.0/joker-0.14.0-mac-amd64.zip"
    sha256 "5771603c9d582aadf38c59a7ba19cdcf6cc631ce9ada6630e6912f338ae64fc5"
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
