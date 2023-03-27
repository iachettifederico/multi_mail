module Factory
  class Emails
    def to_temp(suffix="")
      Email.from_attributes(
        to:      "temp#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email Subject",
        body:    "Email Body",
      )
    end

  end
end
