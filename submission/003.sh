# How many new outputs were created by block 123,456?
block_hash=$(bitcoin-cli getblockhash 123456)
block_info=$(bitcoin-cli getblock "$block_hash" 2)
total_outputs=$(echo "$block_info" | jq '[.tx[] | .vout | length] | add')
echo "$total_outputs"