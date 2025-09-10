# Jupyter Notebook to showcase Db2 VECTOR data type and similarity search
This is my version of a demo showing semantic product recommendation. It is heavily inspired by [Shaikh Quader's demo](https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation).

The demo currently uses shoes as product and properties like color, material, weather resistance, and more as features that serve as input for the embedding. Instead of shoes, other items could be used, such as mutual funds or [ETFs](https://en.wikipedia.org/wiki/Exchange-traded_fund) with their many properties.


**General flow**:
- Setup, including Db2 database connection and creating a table
- Generate fake product data
- Generate vector embeddings for key features using a local ollama service
- Add new [vector-based](https://www.ibm.com/docs/en/db2/12.1.0?topic=list-vector-values) embedding column to table, insert data
- Perform some queries utilizing [vector distance search](https://www.ibm.com/docs/en/db2/12.1.0?topic=functions-vector-distance) for semantic product recommendation (what other products are similar?)
- Cleanup

# Setup
You need access to a Db2 instance and database with minimum version 12.1.2 (Db2 12.1 modpack 2). This can be a local or remote server. I have tested it with Db2 12.1 Community Edition for Docker, see my blog post [Db2 12.1 Community Edition for Docker on Fedora](https://data-henrik.de/2025/01/db2-v12-community-edition-docker-linux/) for details and setup instructions.

- Download [ollama](https://ollama.com/download)
- Download the IBM Granite Embedding model for ollama: `ollama pull hf.co/ibm/granite-embedding-107m-multilingual`
- Install Python packages: `pip install -r requirements.txt`
- Configure `.db2conn` to point to your Db2 instance and database
- Configure `.env` (by copying over `.env-sample`)

Configuration variables and defaults in `.env`:
```sh
EMBEDDING_MODEL='granite-embedding'  # Which embedding model to use
IMPORT_DATA=False                    # Generate or import the data? We generate by default
EXPORT_DATA=False                    # By default, no data is exported
KEEP_DATA=True                       # By default, the table is kept, so you could run your own queries against Db2
```
Tested with by [running the notebook Python 3.13 in Visual Studio Code](https://code.visualstudio.com/docs/datascience/jupyter-notebooks). I have used ollama local to my notebook. See [ollama custom client](https://github.com/ollama/ollama-python?tab=readme-ov-file#custom-client) for a way to configure access to a remote instance of ollama.

# (Major) Components
- [IBM Db2](https://www.ibm.com/products/db2)
- [ollama](https://ollama.com/) with [IBM Granite](https://www.ibm.com/granite) embedding model
- [Jupyter Notebook](https://jupyter.org/)
- [JupySQL magic for Jupyter Notebooks](https://jupysql.ploomber.io/en/latest/quick-start.html)

# More on Db2 Vector / AI support
- https://github.com/shaikhq/db2ai for a curated list of blog posts, samples, talks, and more
- https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation for the idea and code that inspired this demo.
