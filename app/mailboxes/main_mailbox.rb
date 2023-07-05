class MainMailbox < ApplicationMailbox
  def process
    InboundEmail.create!(
      from:       mail.from.first,
      to:         mail.to.first,
      subject:    mail.subject.to_s,
      raw_body:   mail.body.to_s,
      date:       mail.date.to_datetime,
      message_id: mail.message_id,
    )
  end
end

# Accessible objects
#   - mail
#   - inbound_email

# Mail methods
# :[],
# :[]=,
# :action,
# :add_charset,
# :add_content_transfer_encoding,
# :add_content_type,
# :add_date,
# :add_file,
# :add_message_id,
# :add_mime_version,
# :add_part,
# :all_parts,
# :attachment,
# :attachment?,
# :attachments,
# :bcc,
# :bcc=,
# :bcc_addresses,
# :bcc_addrs,
# :body,
# :body=,
# :body_encoding,
# :body_encoding=,
# :bounced?,
# :boundary,
# :cc,
# :cc=,
# :cc_addresses,
# :cc_addrs,
# :charset,
# :charset=,
# :comments,
# :comments=,
# :content_description,
# :content_description=,
# :content_disposition,
# :content_disposition=,
# :content_id,
# :content_id=,
# :content_location,
# :content_location=,
# :content_transfer_encoding,
# :content_transfer_encoding=,
# :content_type,
# :content_type=,
# :content_type_parameters,
# :convert_to_multipart,
# :date,
# :date=,
# :decode_body,
# :decoded,
# :default,
# :deliver,
# :deliver!,
# :delivery_handler,
# :delivery_handler=,
# :delivery_method,
# :delivery_status_part,
# :delivery_status_report?,
# :destinations,
# :diagnostic_code,
# :encoded,
# :envelope_date,
# :envelope_from,
# :error_status,
# :errors,
# :filename,
# :final_recipient,
# :find_first_mime_type,
# :from,
# :from=,
# :from_address,
# :from_addrs,
# :has_attachments?,
# :has_charset?,
# :has_content_transfer_encoding?,
# :has_content_type?,
# :has_date?,
# :has_message_id?,
# :has_mime_version?,
# :header,
# :header=,
# :header_fields,
# :headers,
# :html_part,
# :html_part=,
# :in_reply_to,
# :in_reply_to=,
# :inform_interceptors,
# :inform_observers,
# :inspect_structure,
# :is_marked_for_delete?,
# :keywords,
# :keywords=,
# :main_type,
# :mark_for_delete=,
# :message_id,
# :message_id=,
# :method_missing,
# :mime_type,
# :mime_version,
# :mime_version=,
# :multipart?,
# :multipart_report?,
# :part,
# :parts,
# :perform_deliveries,
# :perform_deliveries=,
# :raise_delivery_errors,
# :raise_delivery_errors=,
# :raw_envelope,
# :raw_source,
# :read,
# :ready_to_send!,
# :received,
# :received=,
# :recipients,
# :recipients_addresses,
# :references,
# :references=,
# :remote_mta,
# :reply,
# :reply_to,
# :reply_to=,
# :resent_bcc,
# :resent_bcc=,
# :resent_cc,
# :resent_cc=,
# :resent_date,
# :resent_date=,
# :resent_from,
# :resent_from=,
# :resent_message_id,
# :resent_message_id=,
# :resent_sender,
# :resent_sender=,
# :resent_to,
# :resent_to=,
# :retryable?,
# :return_path,
# :return_path=,
# :sender,
# :sender=,
# :set_envelope,
# :skip_deletion,
# :smtp_envelope_from,
# :smtp_envelope_from=,
# :smtp_envelope_to,
# :smtp_envelope_to=,
# :sub_type,
# :subject,
# :subject=,
# :text?,
# :text_part,
# :text_part=,
# :to,
# :to=,
# :to_addresses,
# :to_addrs,
# :transport_encoding,
# :transport_encoding=,
# :without_attachments!,
# :x_original_to_addresses