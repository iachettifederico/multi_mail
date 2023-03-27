require_relative "../boot"

require "rake"
require "roda"

Dir.chdir(WEB_APP) do
  class RodaApp < Roda
    FileList[WEB_APP.join("plugins/*.rb")].each do |file|
      require file
    end

    plugin :hash_branches

    FileList[WEB_APP.join("routes/*.rb")].each do |file|
      require file
    end

    route do |r|

      puts "  >>>>> #{__FILE__}:#{__LINE__}".purple
      ap(params: r.params)
      puts "  >>>>> #{__FILE__}:#{__LINE__}".purple

      r.hash_branches
    end
  end
end
