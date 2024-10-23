#!/bin/bash

# Example of creating hentai subject file
# $ '/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com' > hentai

export hentai='/C=JP/ST=Tokyo/L=Tokyo/O=Raphielscape LLC. and Haruka LLC./OU=Raphielscape LLC. and Haruka LLC./CN=Raphielscape LLC. and Haruka LLC./emailAddress=legal@hentaios.com'
for x in testkey testcert releasekey platform shared media networkstack bluetooth nfc verity; do \
    ../../../../../../development/tools/make_key ./$x "$hentai"; \
done
