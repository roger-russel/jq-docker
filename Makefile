TAGV1.6:=1.6
TAGLatest=${TAGV1.6}

build:
	@docker build -t "rogerrussel/jq:latest" --build-arg TAG=${TAGLatest} .
	@docker push rogerrussel/jq:latest

build-v1.6:
	@docker build -t "rogerrussel/jq:${TAGV1.6}" --build-arg TAG=${TAGV1.6} .
	@docker push rogerrussel/jq:${TAGV1.6}
