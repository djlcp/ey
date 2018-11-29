# date_format = request.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id request.id
json.title request.description
json.start request.start
json.end request.end

# json.color event.color unless event.color.blank?
# json.allDay request.all_day_event? ? true : false

json.update_url request_path(request, method: :patch)