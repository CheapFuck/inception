#!/bin/bash

TEMPLATE_FILE="wp-config-template.php"
OUTPUT_FILE="wp-config.php"

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template file not found: $TEMPLATE_FILE"
  exit 1
fi

# Copy template content
CONTENT=$(<"$TEMPLATE_FILE")

# Loop through all environment variables
while IFS='=' read -r name value; do
  # Escape backslashes, forward slashes, ampersands, and other special sed characters
  escaped_value=$(printf '%s\n' "$value" | sed -e 's/[&/\]/\\&/g')

  # Replace ${VAR_NAME} with the escaped value
  CONTENT=$(echo "$CONTENT" | sed "s|\${$name}|$escaped_value|g")
done < <(env)

# Write output
echo "$CONTENT" > "$OUTPUT_FILE"

echo "Environment variables replaced and written to $OUTPUT_FILE"
