class RodaApp < Roda
  plugin :json

  hash_branch("api") do |r|
    r.is "status" do
      { status: :ok }
    end

    response.status = 404
    { status: 404 }
  end
end
