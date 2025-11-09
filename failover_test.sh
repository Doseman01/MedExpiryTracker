#!/bin/bash
# Failover Test Script for Blue/Green Deployment
# Purpose: Verify traffic switches to Green when Blue fails


BASE_URL="http://localhost/medications/"   # Nginx endpoint on port 80
CHAOS_URL="http://localhost:8001/chaos/start?mode=error"  # Optional chaos endpoint for Blue


echo "Running Blue/Green failover test..."
echo


#verify medapp_blue is active
echo "Checking if medapp_blue is currently serving traffic..."
curl -i $BASE_URL
echo


# trigger chaos in medapp_blue (simulate failure)
echo "Simulating failure in Blue environment..."
curl -X POST $CHAOS_URL
echo "Chaos triggered ✅"
echo


#end 100 rapid requests to test failover
echo "Sending 100 rapid requests to verify zero errors..."
success=0
for i in {1..100}; do
  status=$(curl -s -o /dev/null -w "%{http_code}" $BASE_URL)
  if [ "$status" = "200" ]; then
    ((success++))
  fi
done


echo "Success rate: $success/100"
if [ "$success" -eq 100 ]; then
  echo "✅ All requests succeeded. Failover works!"
else
  echo "⚠️ Some requests failed. Check logs for issues."
fi
echo


#verify traffic switched to medapp_green
echo "Checking which environment is now serving traffic..."
curl -i $BASE_URL
echo

