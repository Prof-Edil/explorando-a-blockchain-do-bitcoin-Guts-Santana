# Only one single output remains unspent from block 123,321. What address was it sent to?
call_api="https://blockchain.info/block-height/123321?format=json"
data=$(curl -s $call_api)
output=$(echo "$data" | jq -r '.blocks[0].tx[] | select(.out[].spent == false) | .out[] | select(.spent == false) | .addr' | head -n 1)

echo $output