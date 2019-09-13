# JQ Docker

This JQ project was made with the Scratch image and the binary of JQ.
The tag version are exactly version of JQ.

I'm wondering if I would add an image with sh with it too to simplify some operations.

## Usage Examples

The command bellow show how to use jq into a file named test.json

The trick is mount this file inside the container.

```sh
docker run -v $(pwd)/test.json:/test.json rogerrussel/jq jq '.' ./test.json
```
