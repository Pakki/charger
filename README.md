# README

## Charging stations demo project

- Ruby version - 3.1.0
- Ruby on Rails - 7.0.1

After installing these project, you can fill DB with test data, by `rails db:seed`.

To get all charging points - `curl -H "Content-Type: application/json" -X GET http://127.0.0.1:3000/points`

To add new charging session, try `curl -d'{"client_id":"1", "connector_id":"1"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:3000/sessions`

To finish session - `curl -d'{"charged":"123"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:3000/sessions/:session_id/stop` - don't forget session id
