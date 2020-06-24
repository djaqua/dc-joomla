#!/bin/bash

pwgen() {
    # other password generation algorithms built on Linux core utilities:
    # https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/
    date  | sha256sum | base64 | head -c ${1:-24}
}

echo "MYSQL_ROOT_PASSWORD=`pwgen`" > .env
