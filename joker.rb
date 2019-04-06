class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.2/joker-0.12.2-linux-amd64.zip"
    sha256 "0d15492eb1fbf0dfb80f91e49d7d0ab9aa2ade9cc6446fd46361bd0b09e8b7be"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.2/joker-0.12.2-mac-amd64.zip"
    sha256 "4fc8f9e93140f5f13bb625b943bfff6ada270d76963ad59ece644bb6112e2587"
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
