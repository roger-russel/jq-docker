ARG FROM_IMG=scratch
FROM ${FROM_IMG}

ARG JQ_VERSION
COPY ./jq/jq-${JQ_VERSION} /bin/jq