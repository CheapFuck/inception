#!/bin/sh

TEMPLATE_FILE="wp-config-template.php"
OUTPUT_FILE="wp-config.php"

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template file not found: $TEMPLATE_FILE"
  exit 1
fi

# Read template content
CONTENT=$(cat "$TEMPLATE_FILE")

# Loop through all environment variables
for var in $(env | cut -d= -f1); do
  value=$(printenv "$var")
  # Escape &, /, and \
  safe_value=$(printf '%s' "$value" | sed -e 's/[\/&]/\\&/g')
  # Replace ${VAR} with the env value
  CONTENT=$(printf '%s\n' "$CONTENT" | sed "s/\${$var}/$safe_value/g")
done

# Output to final file
printf '%s\n' "$CONTENT" > "$OUTPUT_FILE"

echo "Environment variables replaced and written to $OUTPUT_FILE"
