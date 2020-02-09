class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.14.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.14.2/joker-0.14.2-linux-amd64.zip"
    sha256 "85df2613232cb634c87d4187c57c4a52065337abf986a890817bb081d7cab7a7"
  else
    url "https://github.com/candid82/joker/releases/download/v0.14.2/joker-0.14.2-mac-amd64.zip"
    sha256 "082c5dbd533b888e316e99b5c4763c08e3508af4d0f8f64305956489ff7be5d3"
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
