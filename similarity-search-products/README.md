# Jupyter Notebook to showcase Db2 VECTOR data type and similarity search
This is my version of a demo showing semantic product recommendation. It is heavily inspired by [Shaikh Quader's demo](https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation).

General flow:
- Setup, including Db2 database connection and creating a table
- Generate fake product data
- Generate vector embeddings for key features using a local ollama service
- Add new vector-based embedding column to table, insert data
- Perform some queries utilizing vector distance search for semantic product recommendation (what other products are similar?)
- Cleanup


# More on Db2 Vector / AI support
- https://github.com/shaikhq/db2ai for a curated list of blog posts, samples, talks, and more
- https://github.com/shaikhq/db2-samples/tree/master/ai-vectors/product-recommendation for the idea and code that inspired this demo.
