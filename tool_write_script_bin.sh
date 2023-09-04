#!/usr/bin/env bash

source ./default_path.sh


file_name="$1";
content="$2";

echo "#!/usr/bin/env bash
$content
" > "$BIN_PATH/$file_name"
chmod +x "$BIN_PATH/$file_name"