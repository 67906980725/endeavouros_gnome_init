#!/usr/bin/env bash

file_name="$1";
content="$2";

echo "#!/usr/bin/env bash
$content
" > "$file_name"
chmod +x "$file_name"