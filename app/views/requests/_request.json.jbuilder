# date_format = request.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id request.id
json.title "#{request.user.full_name} - #{request.leave_type.humanize}"
json.user request.user.full_name
json.leave_type request.leave_type.humanize
json.start request.start
json.end request.end
json.description request.description

json.color Request::LEAVE_TYPE_COLORS[request.leave_type.to_sym]
# json.allDay request.all_day_event? ? true : false

json.update_url request_path(request, method: :patch)
