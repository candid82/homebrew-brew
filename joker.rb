class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.8.2"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.2/joker-linux-arm64.zip"
    sha256 "12a05f494a8018402840c0f5cae26df635e100596e839a5f0417d34cd356a7db" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.8.2/joker-linux-amd64.zip"
    sha256 "fc877bd21959c82885ae8a130da009023e6dbe72c2ede84a025e065c04262d2d" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.2/joker-mac-arm64.zip"
    sha256 "e230c66d238add22086a56fc20d35290d322325b000c172e90b20ea2e2bac462" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.8.2/joker-mac-amd64.zip"
    sha256 "18f008d952428f7a484cda14bfae9a4413d84e5bd42b5f0abadc27be622086d2" # mac-amd64
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
