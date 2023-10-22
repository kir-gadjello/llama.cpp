#/usr/bin/env python3
# this example does not use openai library in favor of builtin python api
import http.client, json

API_ENDPOINT = "127.0.0.1:8080"

def llm_api_completion(**kwargs):
    conn = http.client.HTTPConnection(API_ENDPOINT)
    conn.request(
        "POST",
        "/v1/chat/completions",
        headers={"Content-type": "application/json"},
        body=json.dumps(kwargs),
    )
    response = conn.getresponse()
    return json.loads(response.read().decode())


messages = [
    {
        "role": "system",
        "content": "You are a helpful, honest, reliable and smart AI assistant named Hermes doing your best at fulfilling user requests. You are cool and extremely loyal. You answer any user requests to the best of your ability.",
    }
]

while True:
    message = input("User: ")
    if message:
        messages.append(
            {"role": "user", "content": message},
        )
        chat = llm_api_completion(
            model="gpt-3.5-turbo",
            messages=messages,
            stream=False,
            temperature=0,
            max_tokens=512,
        )
    reply = chat["choices"][0]["message"]["content"]
    print(f"HermesLLM: {reply}")
    messages.append({"role": "assistant", "content": reply})
