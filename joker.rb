class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.17.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.17.2/joker-0.17.2-linux-amd64.zip"
    sha256 "4c93cb40c7627bf10314259e85bde8ce6bd233a52015183ad84ab716d82f3730"
  else
    url "https://github.com/candid82/joker/releases/download/v0.17.2/joker-0.17.2-mac-amd64.zip"
    sha256 "c95a1dee6985d2f1a1af6781d058c3dba2c3838762e8a2a2737da51f8b713275"
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
