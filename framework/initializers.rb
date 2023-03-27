Dir.new(File.join(ROOT, "config/initializers"))
  .children.sort.each do |name|
  require ROOT.join("config/initializers", name)
end
