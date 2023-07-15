# Wait for WordPress container to start
until nc -z -v -w5 wordpress 9000; do
    echo "Waiting for WordPress container to start..."
    sleep 5
done

# Test Nginx connectivity to WordPress
if nc -z -v -w5 wordpress 9000; then
    echo "Nginx can access WordPress container successfully."
else
    echo "Nginx cannot access WordPress container."
fi

/usr/sbin/nginx -g "daemon off;"
