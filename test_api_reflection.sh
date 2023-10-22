#!/bin/bash

curl --trace-ascii - --request POST \
 --url 'http://127.0.0.1:8080/v1/chat/completions' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer example' \
  --header 'Content-Type: application/json' \
  --data '{"model": "gpt-3.5-turbo", "max_tokens": 256, "temperature": 0, "messages": [
{"role": "system","content": "You are a helpful, honest, reliable and smart AI assistant named Hermes doing your best at fulfilling user requests. You are cool and extremely loyal. You answer any user requests to the best of your ability."},
{"role": "user", "content": "Count from 1 to 3. After that output your thoughts on possible reasons I am asking you this"}
]}'
