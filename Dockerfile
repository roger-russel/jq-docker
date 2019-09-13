FROM scratch
ARG TAG
COPY ./jq/jq-$TAG /bin/jq