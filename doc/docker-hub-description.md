# JQ Docker

This JQ project was made with the Scratch image and the binary of JQ.

The tag version are exactly version of JQ.

The Dockerfile can be seen into my github project [https://github.com/roger-russel/jq-docker](https://github.com/roger-russel/jq-docker).

Not that default version doesn't have sh or bash into it. Which means that only jq will be acessible.

## Tags

The current latest is 1.6.
Tags with "-sh" are build with buzybox instead of scratch.

* latest, latest-sh
* 1.6, 1.6-sh
* 1.5, 1.5-sh

## Usages

The command bellow show how to use jq into a file named test.json

The trick is mount this file inside the container.

```sh
docker run -v $(pwd)/test.json:/test.json rogerrussel/jq:latest jq '.' ./test.json
```

If is desirable to not create a file then you must use an tag with bash, like the example bellow.

```sh
docker run rogerrussel/jq:latest-sh sh -c 'echo "{\"foo\":\"bar\"}" | jq .'
```
