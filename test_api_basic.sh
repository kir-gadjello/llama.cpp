#!/bin/bash

curl --trace-ascii - --request POST \
 --url 'http://127.0.0.1:8080/v1/chat/completions' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer example' \
  --header 'Content-Type: application/json' \
  --data '{"model": "gpt-3.5-turbo", "max_tokens": 256, "temperature": 0, "messages": [{"role": "user", "content": "Count from 1 to 3"}]}'
