class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.8.3"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.3/joker-linux-arm64.zip"
    sha256 "4393b811e58290f00113ff30c4b6c02615e52e63f93fa6bf7e01d260eb7c9d31" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.8.3/joker-linux-amd64.zip"
    sha256 "99b9aa4ff6e600d5895b4edf989cbdb753d096d0c2fe07c9d4dae1734a112a38" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.3/joker-mac-arm64.zip"
    sha256 "e367dce3b95f9d7e0f8e224b5998876bbf804cec9b9b190df9ad16eebe95a12a" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.8.3/joker-mac-amd64.zip"
    sha256 "79eade16e6f81ad72689cdffd46ac237b792fbb4274b634f21709ed4a95e4393" # mac-amd64
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
