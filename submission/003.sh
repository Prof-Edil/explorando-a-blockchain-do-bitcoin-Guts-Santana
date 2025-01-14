# How many new outputs were created by block 123,456?
block_hash=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblockhash 123456)
block_info=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_231 -rpcpassword=Fc3IHA1VGEyI getblock "$block_hash" 2)
total_outputs=$(echo "$block_info" | jq '[.tx[] | .vout | length] | add')
echo "$total_outputs"