class RodaApp < Roda
  plugin :phlex
  plugin :empty_root

  hash_branch("") do |r|
    r.root do
      Views::Home.new
    end
  end
end
