# Jupyter Notebook to showcase Db2 VECTOR data type and similarity search
This is my version of a demo showing semantic product recommendation. It is heavily inspired by [Shaikh Quader's demo](https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation).

General flow:
- Setup, including Db2 database connection and creating a table
- Generate fake product data
- Generate vector embeddings for key features using a local ollama service
- Add new [vector-based](https://www.ibm.com/docs/en/db2/12.1.0?topic=list-vector-values) embedding column to table, insert data
- Perform some queries utilizing [vector distance search](https://www.ibm.com/docs/en/db2/12.1.0?topic=functions-vector-distance) for semantic product recommendation (what other products are similar?)
- Cleanup

# Setup
- Download [ollama](https://ollama.com/download)
- Download the IBM Granite Embedding model for ollama: `ollama pull hf.co/ibm/granite-embedding-107m-multilingual`
- Install Python packages: `pip install -r requirements.txt`
- Configure `.db2conn` to point to your Db2 instance and database
- Configure `.env` (by copying over `.env-sample`)

Tested with by [running the notebook Python 3.13 in Visual Studio Code](https://code.visualstudio.com/docs/datascience/jupyter-notebooks).

# More on Db2 Vector / AI support
- https://github.com/shaikhq/db2ai for a curated list of blog posts, samples, talks, and more
- https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation for the idea and code that inspired this demo.
