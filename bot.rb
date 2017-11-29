include Facebook::Messenger

Bot.on :message do |message|
  message.typing_on

  sleep 0.5

  message.reply(text: 'Hello!')
end
