# Local RAG AI Agent using only free tools

Containerized setup using the following tools:

- <a href="https://n8n.io" target="_blank">n8n</a> workflow automation storing data in a <a href="https://www.postgresql.org" target="_blank">PostgreSQL</a> database
- <a href="https://ollama.com" target="_blank">Ollama</a> LLM platform using the Llama 3.2 model (<a href="https://www.ollama.com/search?c=tools" target="_blank">or choose another</a>)
- <a href="https://qdrant.tech" target="_blank">Qdrant</a> vector database for storing embeddings and vector similarity search

## Prerequisites
* Docker & Docker Compose
* NVIDIA graphics card *(not required, see [note about GPU](#gpu) below)*

## Usage
1. Run `docker compose up -d` to deploy<br/>
    * The Ollama container will automatically download the <a href="https://ollama.com/library/nomic-embed-text" target="_blank">Nomic Embed</a> and <a href="https://ollama.com/library/llama3.2" target="_blank">Llama3.2</a> models<br/>
    * The n8n container will import the required credentials and a workflow to get you started
2. Open <a href="http://localhost:5678" target="_blank">n8n</a> in your browser and create the owner account  
3. Open the ***RAG Agent*** workflow and click ***Execute workflow*** in the "Populate Qdrant Collection" group:
<br/><br/>
<img alt="Populate Qdrant Collection" src="https://github.com/ChrisHof/rag-agent-local/blob/main/n8n/workflow.jpg?raw=true"><br/>
This will import some AI-generated sample data for support information of an online store.
5. Once the data was successfully inserted into the Vector store, use the n8n Chat window on the bottom to test the Agent. A prompt like "What is the return policy?" serves as a good test for the imported data.

### Where to go from here
This is just a sample setup to quickly start with a dockerized RAG Agent. You'll have to populate your Vector store with the relevant data (using n8n, custom APIs, etc.) and optimize the AI Agent & LLM to suit your needs.<br/>
A nice overview of all these concepts and how to implement them can be found in <a href="https://youtu.be/Ey18PDiaAYI?feature=shared&t=3085" target="_blank">this YouTube video</a>.

#### <a name="gpu"></a>Note on GPU usage
If no NVIDIA graphics card is available, edit `compose.yaml` to suit your needs. Check the <a href="https://docs.docker.com/compose/how-tos/gpu-support/#enabling-gpu-access-to-service-containers" target="_blank">Docker docs</a> for more infos.<br/>
You will have to edit the *Ollama* and *Qdrant* services accordingly.