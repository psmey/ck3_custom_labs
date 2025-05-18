#!/bin/bash

cat > workshopitem.vdf << EOF
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

cat workshopitem.vdf

steamcmd \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +workshop_build_item /home/steam/workshopitem.vdf \
    +quit
