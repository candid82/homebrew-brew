class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.8.0"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.0/joker-linux-arm64.zip"
    sha256 "7ed124a7a980f4851e3a546e033f04ba649c07156c15e0a0d718ee8f154896e2" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.8.0/joker-linux-amd64.zip"
    sha256 "f52ca5e3fb47bb1740907fef8b3115b50ef5ab9111547362c53a38da185681e3" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.0/joker-mac-arm64.zip"
    sha256 "28c614b0a0e8cec30e96b31f2145c047429089e877bc8cc346cbac320c9a4756" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.8.0/joker-mac-amd64.zip"
    sha256 "81dea170a731dec0e562fb69f1f7dc53e0adf77b84fab947cf8d7748baa81bd3" # mac-amd64
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
