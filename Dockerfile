FROM nimlang/nim:1.0.0-alpine

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy local code to the container image.
COPY . ./

RUN nim c -d:release app.nim

# Run the web service on container startup.
CMD [ "./app"]