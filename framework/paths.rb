require "pathname"
ROOT = Pathname(File.join(__dir__, "..")).expand_path

WEB_APP = ROOT.join("web")
