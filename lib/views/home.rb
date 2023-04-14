module Views
  class Home < Views::Layouts::Page
    def template
      h1 { "Home page #{Time.now}" }
    end
  end
end
