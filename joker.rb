class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.1.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.1.0/joker-linux-amd64.zip"
    sha256 "a2d05da729b49558333a2484be745c6f7a4f4fe25b39df039b3a255a43310c90"
  else
    url "https://github.com/candid82/joker/releases/download/v1.1.0/joker-mac-amd64.zip"
    sha256 "dd4647910f5bada8fc5f93e1f68f576ffc604fa3094d4a6efd1d416a17a7edbc"
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
