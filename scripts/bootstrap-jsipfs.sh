#!/bin/bash
FILE=$PWD/swarm.key
DESTINATION=$HOME/.jsipfs/swarm.key

if [ -f "$FILE" ]; then
  echo
  echo "$FILE exists"
else
  echo
  echo "$FILE does not exist!"
  exit
fi

set -v

jsipfs bootstrap rm --all

jsipfs bootstrap add /dns4/peer1.ipfsprivi.com/tcp/4001/ipfs/12D3KooWL8M9mcMyhat5jWx2SKrun34Jm7FtNfqEao6JenrJLguo
jsipfs bootstrap add /dns4/peer2.ipfsprivi.com/tcp/4002/ipfs/12D3KooWPZCFnEwEBHr4MvXEGS2PcGSy89J17JVuPH1ruKDUutLv
jsipfs bootstrap add /dns4/peer3.ipfsprivi.com/tcp/4003/ipfs/12D3KooWPzzuBtqAbca6XwC3DquqHBKLMkUox37aTNicSF6PpLSm
jsipfs bootstrap add /dns4/peer4.ipfsprivi.com/tcp/4001/ipfs/12D3KooWMhpvPTERUivrdPhmUDFSiXLRCBmw1z8XAgYBjgwJgdNz
jsipfs bootstrap add /dns4/peer5.ipfsprivi.com/tcp/4001/ipfs/12D3KooWRJFPELScQeUYQ4jogBDAb8pWcnm4Nk3pTamynoHVE2TK
jsipfs bootstrap add /dns4/peer6.ipfsprivi.com/tcp/4001/ipfs/12D3KooWGBrN664m2j6tkofhrDWvWVuHD6265aQ3iX72firZ5eYY

cp $FILE $DESTINATION