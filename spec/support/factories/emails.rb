module Factory
  class Emails
    def email_to(account, prefix: "", suffix: "")
      Email.from_attributes(
        to:      "#{prefix}#{account}#{suffix}@example.com",
        from:    "external@test.com",
        subject: "Email for #{account}",
        body:    "Email Body",
      )
    end

    def to_pepe(prefix: "", suffix: "")
      email_to("pepe", suffix: suffix, prefix: prefix)
    end

    def to_toto(prefix: "", suffix: "")
      email_to("toto", suffix: suffix, prefix: prefix)
    end

  end
end
