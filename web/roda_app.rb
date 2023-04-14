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

    environment = Environment.current

    route do |r|
      puts "  >>>>> #{__FILE__}:#{__LINE__}".purple
      ap(params: r.params)
      puts "  >>>>> #{__FILE__}:#{__LINE__}".purple

      r.is "received_emails" do
        environment.received_emails.display
      end
    end
  end
end
