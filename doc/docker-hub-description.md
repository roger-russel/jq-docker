# JQ Docker

This JQ project was made with the Scratch image and the binary of JQ.

The tag version are exactly version of JQ.

The Dockerfile can be seen into my github project [https://github.com/roger-russel/jq-docker](https://github.com/roger-russel/jq-docker).

Not that default version doesn't have sh or bash into it. Which means that only jq will be acessible.

I'm wondering create a image with sh into it, but for now I will put how jq can be used with the jq only image.

## Usages

The command bellow show how to use jq into a file named test.json

The trick is mount this file inside the container.

```sh
docker run -v $(pwd)/test.json:/test.json rogerrussel/jq jq '.' ./test.json
```
