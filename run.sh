docker run -p 8181:8080 -d --rm \
  --name cherrypy-test-1 \
  --mount type=bind,source="$(pwd)"/mnt_data,target=/mnt/data \
  cherrypy-test-image
docker run -p 8282:8080 -d --rm \
  --name cherrypy-test-2 \
  --mount type=bind,source="$(pwd)"/mnt_data,target=/mnt/data \
  cherrypy-test-image
