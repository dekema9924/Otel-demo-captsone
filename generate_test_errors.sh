#!/bin/bash

# Script to generate test errors, warnings, and traffic for OpenTelemetry demo
# This will create realistic log entries in Elasticsearch for testing dashboards

FRONTEND_URL="http://10.96.60.230:8080"
OTEL_COLLECTOR="http://10.96.60.230:4318"

echo "🚀 Starting test traffic generation..."
echo "This will generate logs, traces, and errors for your dashboard"
echo ""

# Function to send test log to OTel Collector
send_test_log() {
    local severity=$1
    local message=$2
    local service=$3
    
    curl -s -X POST "${OTEL_COLLECTOR}/v1/logs" \
      -H "Content-Type: application/json" \
      -d "{
        \"resourceLogs\": [{
          \"resource\": {
            \"attributes\": [{
              \"key\": \"service.name\",
              \"value\": {\"stringValue\": \"${service}\"}
            }]
          },
          \"scopeLogs\": [{
            \"logRecords\": [{
              \"timeUnixNano\": \"$(date +%s)000000000\",
              \"severityText\": \"${severity}\",
              \"body\": {\"stringValue\": \"${message}\"}
            }]
          }]
        }]
      }" > /dev/null
}

# Generate normal traffic to frontend
echo "1️⃣  Generating normal frontend traffic..."
for i in {1..10}; do
    curl -s "${FRONTEND_URL}" > /dev/null &
    curl -s "${FRONTEND_URL}/api/products" > /dev/null &
done
sleep 2

# Generate test ERROR logs
echo "2️⃣  Generating ERROR logs..."
send_test_log "ERROR" "Database connection timeout after 30s" "frontend"
send_test_log "ERROR" "Failed to process payment: Invalid credit card" "payment"
send_test_log "ERROR" "Checkout service unavailable: Connection refused" "checkout"
send_test_log "ERROR" "Product not found in catalog: ID 99999" "product-catalog"
send_test_log "ERROR" "Cart service error: Redis connection lost" "cart"
send_test_log "ERROR" "Email delivery failed: SMTP timeout" "email"
send_test_log "ERROR" "Shipping calculation failed: Invalid address" "shipping"
send_test_log "ERROR" "Authentication failed: Invalid token" "frontend"
send_test_log "ERROR" "Rate limit exceeded for user: 192.168.1.100" "ad"
send_test_log "ERROR" "Currency conversion failed: API unreachable" "currency"

echo "3️⃣  Generating WARNING logs..."
send_test_log "WARN" "High memory usage detected: 85% utilization" "frontend"
send_test_log "WARN" "Slow database query: took 2.5s to complete" "product-catalog"
send_test_log "WARN" "Cart item count exceeds recommended limit: 50 items" "cart"
send_test_log "WARN" "Deprecated API endpoint called: /v1/products" "frontend"
send_test_log "WARN" "Connection pool near capacity: 95/100 connections" "checkout"
send_test_log "WARN" "Cache miss rate high: 45% in last 5 minutes" "recommendation"
send_test_log "WARN" "Retry attempt 3/3 for external service call" "payment"
send_test_log "WARN" "Session expiring soon: 2 minutes remaining" "frontend"

echo "4️⃣  Generating INFO logs..."
send_test_log "INFO" "User successfully logged in: user@example.com" "frontend"
send_test_log "INFO" "Product added to cart: ProductID 12345" "cart"
send_test_log "INFO" "Order placed successfully: OrderID ABC-123" "checkout"
send_test_log "INFO" "Payment processed: Transaction ID xyz789" "payment"
send_test_log "INFO" "Email sent successfully: Order confirmation" "email"
send_test_log "INFO" "Shipping label created: Tracking TRK123456" "shipping"

# Generate more realistic traffic patterns
echo "5️⃣  Simulating realistic traffic patterns..."
for iteration in {1..5}; do
    echo "   Iteration $iteration/5..."
    
    # Mix of successful and failed requests
    for i in {1..5}; do
        curl -s "${FRONTEND_URL}" > /dev/null &
        curl -s "${FRONTEND_URL}/api/products" > /dev/null &
    done
    
    # Random errors
    if [ $((RANDOM % 3)) -eq 0 ]; then
        send_test_log "ERROR" "Random error occurred: Request timeout" "frontend"
    fi
    
    # Random warnings
    if [ $((RANDOM % 2)) -eq 0 ]; then
        send_test_log "WARN" "Performance degradation detected" "checkout"
    fi
    
    sleep 3
done

# Generate spike in errors (simulating an incident)
echo "6️⃣  Simulating error spike (incident scenario)..."
for i in {1..20}; do
    send_test_log "ERROR" "Service outage: Database connection failed" "checkout" &
    send_test_log "ERROR" "Cascade failure: Dependent service unavailable" "payment" &
done
sleep 2

echo ""
echo "✅ Test data generation complete!"
echo ""
echo "📊 You should now see:"
echo "   - Total Logs: Increased significantly"
echo "   - Error Count: 30+ errors"
echo "   - Warning Count: 8+ warnings"
echo "   - Multiple services with activity"
echo ""
echo "🔍 Check your Grafana dashboard at: http://10.96.60.230:32994"
echo "   Dashboard: 'Service Overview Dashboard'"
echo ""
echo "💡 Tip: Set time range to 'Last 5 minutes' to see all the test data"
echo ""

# Keep generating background traffic
echo "🔄 Generating background traffic for 2 minutes..."
echo "   (Press Ctrl+C to stop early)"
for i in {1..24}; do
    curl -s "${FRONTEND_URL}" > /dev/null &
    
    if [ $((i % 4)) -eq 0 ]; then
        send_test_log "INFO" "Background activity: Page view" "frontend" &
    fi
    
    if [ $((i % 10)) -eq 0 ]; then
        send_test_log "ERROR" "Intermittent error: Timeout" "checkout" &
    fi
    
    sleep 5
done

echo ""
echo "🎉 All done! Check your dashboard now!"
