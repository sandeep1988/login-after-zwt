json.array!(@followups) do |followup|
  json.extract! followup, :id, :contact_id, :case_id, :followed_up_date, :followed_up_type_id, :followed_up_by, :v_outcome, :d_next_followed_up_date, :next_followed_up_type_id, :next_followed_up_by
  json.url followup_url(followup, format: :json)
end
