#!/bin/bash

echo "🏗️ Build workshopitem.vdf"

cat > /home/steam/workshopitem.vdf << EOF
"workshopitem"
{
    "appid" "$INPUT_GAME_ID"
    "publishedfileid" "$INPUT_MOD_ID"
    "contentfolder" "$INPUT_MOD_CONTENT_PATH"
    "previewfile" "$INPUT_WORKSHOP_THUMBNAIL_PATH"
    "visibility" "$INPUT_WORKSHOP_VISIBILITY"
    "title" "$INPUT_WORKSHOP_TITLE"
    "description" "$INPUT_WORKSHOP_DESCRIPTION"
    "changenote" "$INPUT_WORKSHOP_CHANGENOTE"
}
EOF

cat /home/steam/workshopitem.vdf

echo "🚀 Upload to Steam Workshop"
steamcmd \
    +login "$INPUT_STEAM_USERNAME" "$INPUT_STEAM_PASSWORD" \
    +workshop_build_item /home/steam/workshopitem.vdf \
    +quit
