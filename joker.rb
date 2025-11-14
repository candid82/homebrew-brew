class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.5.7"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.5.7/joker-linux-amd64.zip"
    sha256 "087ba2a94297ff97d767753536fea00dd6ad759a4a1471f446e246d3f777c058"
  else
    url "https://github.com/candid82/joker/releases/download/v1.5.7/joker-mac-amd64.zip"
    sha256 "31a8f199364ca03fb30d0d1a2e1fd9a25004c9de53e8350d225d3b2a598a2163"
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
