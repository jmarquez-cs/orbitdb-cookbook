FROM orbitdb/orbit-db-http-api

WORKDIR /api/src/

COPY ./ipfs-api.js /api/src/factory/ipfs-api.js

CMD ["node", "/api/src/cli.js", "local", "--no-https", "--http1"]