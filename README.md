# README

## Electric cars charging stations API, demo project

- Ruby version - 3.4.4
- Ruby on Rails >= 8.0.2

After installing these project, you can fill DB with test data, by `rails db:seed`.

To get all charging points - `curl -H "Content-Type: application/json" -X GET http://127.0.0.1:3000/points`

To start a new charging session, try `curl -d'{"client_id":"1", "connector_id":"1"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:3000/sessions`

To finish a charging session - `curl -d'{"charged":"123"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:3000/sessions/:session_id/stop` - don't forget session id
