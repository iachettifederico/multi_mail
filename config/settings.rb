class Settings
  def load_dirs
    [
      ROOT.join("lib"),
      WEB_APP,
    ]
  end

  def ignore_dirs
    [
      WEB_APP.join("plugins"),
      WEB_APP.join("routes"),
    ]
  end
end
