# JQ Docker

This JQ project was made with the Scratch image and the binary of JQ.

The tag version is exactly version of JQ.

The Dockerfile can be seen in my Github project [https://github.com/roger-russel/jq-docker](https://github.com/roger-russel/jq-docker).

Not that default version doesn't have sh or bash into it. Which means that only JQ will be accessible.

## Tags

The current latest is 1.6.
Tags with "-sh" are build with Buzybox instead of scratch.

* latest, latest-sh, latest-alpine
* 1.6, 1.6-sh, 1.6-alpine
* 1.5, 1.5-sh, 1.5-alpine

## Usages

The command below shows how to use JQ into a file named test.json

The trick is to mount this file inside the container.

```sh
docker run -v $(pwd)/test.json:/test.json rogerrussel/jq:latest jq '.' ./test.json
```

It is possible to run dynamically the json object was can be seen below:

```sh
docker run rogerrussel/jq:latest-sh sh -c 'echo "{\"foo\":\"bar\"}" | jq .'
```

Or with alpine image:

```sh
docker run rogerrussel/jq:latest-alpine sh -c 'echo "{\"foo\":\"bar\"}" | jq .'
```
