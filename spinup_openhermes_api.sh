#!/bin/bash

if [ ! -f ./server_oaicompat ]; then
    echo "Building llama.cpp-based server binary...";
    mkdir build;
    cd build;
    cmake ..;
    cmake --build . --config Release --target server_oaicompat;
    cp ./bin/server_oaicompat ../server_oaicompat
    cd ..;
fi

# ~4 Gb download
if [ ! -f ./openhermes-2-mistral-7b.Q4_K_M.gguf ]; then
    echo "Downloading 4.1Gb openhermes2 AI checkpoint...";
    wget -c 'https://huggingface.co/TheBloke/OpenHermes-2-Mistral-7B-GGUF/resolve/main/openhermes-2-mistral-7b.Q4_K_M.gguf'
fi

# runs the llm inference api
./server_oaicompat -m ./openhermes-2-mistral-7b.Q4_K_M.gguf --host 127.0.0.1 --port 8080
