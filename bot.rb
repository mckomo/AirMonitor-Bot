require 'lib/air_monitor'
require 'lib/rom'
require 'lib/user_repository'

include Facebook::Messenger

NORM = 50

user_repository = UserRepository.new(CONTAINER)

Bot.on :message do |message|
  message.typing_on

  user = find_or_create(user_repository, message.sender['id'])
  station_code = message.quick_reply

  if station_code
    user_repository.update(user.id, station_code: station_code, state: 'station_selected')

    reply_with_latest_measurement(message, station_code)
  elsif user.station_code

    reply_with_latest_measurement(message, user.station_code)
  else
    station_buttons = AirMonitor::Stations.all.map do |s|
      { content_type: 'text', title: s['name'].split(',').last.strip, payload: s['code'] }
    end

    message.reply(
      text: 'Wybierz stację:',
      quick_replies: station_buttons
    )
  end
end

def find_or_create(user_repository, messenger_id)
  user_repository.users.where(messenger_id: messenger_id).one || user_repository.create(messenger_id: messenger_id, state: 'initial')
end

def reply_with_latest_measurement(message, station_code)
  measurement_value = AirMonitor::Measurements.latest(station_code)['value']
  norm_percentage = measurement_value.to_f * 100 / NORM

  message.reply(
    text: "Aktualny stan powietrza dla stacji #{station_code} to: #{norm_percentage.round(1)}% normy"
  )
end
