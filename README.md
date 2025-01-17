# R2R

R2R (RAG to Riches) is a Python framework designed for the rapid construction and deployment of production-ready Retrieval-Augmented Generation (RAG) systems. This semi-opinionated framework accelerates the transition from experimental stages to production-grade RAG systems.

### Developer Installation

#### Fast Install:

1. **Install R2R directly using `pip`:**
   
   ```bash
   pip install r2r
   ```

#### Full Install:

Follow these steps to ensure a smooth setup:

1. **Install Poetry:**
   - Before installing the project, make sure you have Poetry on your system. If not, visit the [official Poetry website](https://python-poetry.org/docs/#installation) for installation instructions.

2. **Clone and Install Dependencies:**
   - Clone the project repository and navigate to the project directory:
     ```bash
     git clone git@github.com:SciPhi-AI/r2r.git
     cd r2r
     ```
   - Install the project dependencies with Poetry:
     ```bash
     poetry install
     ```

3. **Configure Environment Variables:**
   - You need to set up cloud provider secrets in your `.env` file for the project to work properly. At a minimum, you will need an OpenAI key and a vector database provider.
   - For a fast setup, we recommend creating a project on Supabase, enabling the vector extension, and then updating the `.env.example` with the necessary details.
   - Other providers are also available, such as Qdrant for vector database support.
   - Once updated, copy the `.env.example` to `.env` to apply your configurations:
     ```bash
     cp .env.example .env
     ```


## Demonstration

https://github.com/SciPhi-AI/r2r/assets/68796651/c648ab67-973a-416a-985e-2eafb0a41ef0

## Community
[Join our Discord server!](https://discord.gg/p6KqD2kjtB)

## Core Abstractions

The framework primarily revolves around three core abstractions:

- The **Ingestion Pipeline**: Facilitates the preparation of embeddable 'Documents' from various data formats (json, txt, pdf, html, etc.). The abstraction can be found in [`ingestion.py`](r2r/core/pipelines/ingestion.py).

- The **Embedding Pipeline**: Manages the transformation of text into stored vector embeddings, interacting with embedding and vector database providers through a series of steps (e.g., extract_text, transform_text, chunk_text, embed_chunks, etc.). The abstraction can be found in [`embedding.py`](r2r/core/pipelines/embedding.py).

- The **RAG Pipeline**: Works similarly to the embedding pipeline but incorporates an LLM provider to produce text completions. The abstraction can be found in [`rag.py`](r2r/core/pipelines/rag.py).

Each pipeline incorporates a logging database for operation tracking and observability.

## Running the Examples

The project includes several basic examples that demonstrate application deployment and standalone usage of the embedding and RAG pipelines:

1. [`app.py`](examples/basic/app.py): This example runs the main application, which includes the ingestion, embedding, and RAG pipelines served via FastAPI.

    ```bash
    poetry run uvicorn examples.basic.app:app
    ```

2. [`test_client.py`](examples/client/test_client.py): This example should be run after starting the main application. It demonstrates a test of the user client.

    ```bash
    poetry run python -m examples.client.test_client
    ```

3. [`rag_pipeline.py`](examples/basic/rag_pipeline.py): This standalone example demonstrates the usage of the RAG pipeline. It takes a query as input and returns a completion generated by the OpenAI API.

    ```bash
    poetry run python -m examples.basic.rag_pipeline
    ```

4. [`embedding_pipeline.py`](examples/basic/embedding_pipeline.py): This standalone example demonstrates the usage of the embedding pipeline. It loads datasets from HuggingFace, generates embeddings for the data using the OpenAI API, and stores the embeddings in a PostgreSQL vector database.


    ```bash
    poetry run python -m examples.basic.embedding_pipeline
    ```
