module Factory
  class Emails
    def to_pepe(suffix: "", prefix: "")
      Email.from_attributes(
        to:      "#{prefix}pepe#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email Subject",
        body:    "Email Body",
      )
    end

    def to_toto(suffix: "", prefix: "")
      Email.from_attributes(
        to:      "#{prefix}toto#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email Subject",
        body:    "Email Body",
      )
    end

  end
end
