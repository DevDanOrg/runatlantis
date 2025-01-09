#!/bin/sh

set -e

ATLANTIS_VERSION=0.32.0

wget https://github.com/runatlantis/atlantis/archive/refs/tags/v${ATLANTIS_VERSION}.tar.gz
tar -xzf v${ATLANTIS_VERSION}.tar.gz

cd atlantis-${ATLANTIS_VERSION}
go build -o ../atlantis
cd ..

rm -rf atlantis-${ATLANTIS_VERSION}
rm v${ATLANTIS_VERSION}.tar.gz*

. ./atlantis.env

./atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST"
--repo-config="$REPO_CONFIG"