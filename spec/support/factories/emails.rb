module Factory
  class Emails
    def to_pepe(suffix="")
      Email.from_attributes(
        to:      "pepe#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email Subject",
        body:    "Email Body",
      )
    end

    def to_toto(suffix="")
      Email.from_attributes(
        to:      "toto#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email Subject",
        body:    "Email Body",
      )
    end

  end
end
