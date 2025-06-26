#!/bin/bash
ollama serve &
SERVE_PID=$!

while ! ollama list | grep -q 'NAME'; do
  sleep 1
done

ollama pull nomic-embed-text
ollama pull llama3.2

wait $SERVE_PID
