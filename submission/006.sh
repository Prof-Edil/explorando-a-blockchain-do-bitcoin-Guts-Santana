# Which tx in block 257,343 spends the coinbase output of block 256,128?
block=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblockhash 256128)
coinbase_txid=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblock $block | jq -r '.tx[0]')

block_out=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblockhash 257343)
block_info=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblock $block_out | jq -r .tx[])
for tx in $block_info; do
  inputs=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getrawtransaction $tx true | jq -r '.vin[] | .txid')
  if echo "$inputs" | grep -q "$coinbase_txid"; then
    echo "$tx"
    exit 0
  fi
done
