#!/bin/sh
TEMPLATE_FILE="wp-config-template.php"
OUTPUT_FILE="wp-config.php"
if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Template file not found: $TEMPLATE_FILE"
  exit 1
fi
CONTENT=$(cat "$TEMPLATE_FILE")
for var in $(env | cut -d= -f1); do
  value=$(printenv "$var")
  safe_value=$(printf '%s' "$value" | sed -e 's/[\/&]/\\&/g')
  CONTENT=$(printf '%s\n' "$CONTENT" | sed "s/\${$var}/$safe_value/g")
done
printf '%s\n' "$CONTENT" > "$OUTPUT_FILE"
echo "Environment variables replaced and written to $OUTPUT_FILE"
