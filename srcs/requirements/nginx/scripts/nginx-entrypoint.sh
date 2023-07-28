#!/bin/sh

# Wait for WordPress container to start
# until nc -z -v -w5 wordpress 9000; do
#     echo "Waiting for WordPress container to start..."
#     sleep 10
# done

# echo "Nginx can access WordPress container successfully."

nginx -g "daemon off;"
