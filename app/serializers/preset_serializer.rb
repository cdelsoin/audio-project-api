class PresetSerializer < ActiveModel::Serializer
  attributes :id, :name, :rain, :fire, :thunder, :crickets, :birds, :coffee, :waves, :bowl, :user_id
  has_one :user

  def editable
    scope == object.user
  end
end

# curl --include --request "POST" "http://localhost:3000/presets" \
#         --header "Content-Type: application/json" \
#         --data $'{
#           "preset": {
#             "name": "somename",
#             "rain": 1,
#             "fire": 1,
#             "thunder": 1,
#             "crickets": 1,
#             "birds": 1,
#             "coffee": 1,
#             "waves": 1,
#             "bowl": 1
#           }
#         }'
