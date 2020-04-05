class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.1/joker-0.15.1-linux-amd64.zip"
    sha256 "79a6552763acc7eb14618bfdcc0d062b204dd6d9eb2633fa609a1fb6e13be632"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.1/joker-0.15.1-mac-amd64.zip"
    sha256 "59ef67bf0bc8e437ac55d192d8f6e77292762df37e5a9810615cc8c3de44a754"
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
