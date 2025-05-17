#!/bin/bash

cat > workshopitem.vdf << EOF
"workshopitem"
{
    "appid" "$GAME_ID"
    "publishedfileid" "$MOD_ID"
    "contentfolder" "$MOD_CONTENT_PATH"
    "previewfile" "$WORKSHOP_THUMBNAIL_PATH"
    "visibility" "$WORKSHOP_VISIBILITY"
    "title" "$WORKSHOP_TITLE"
    "description" "$WORKSHOP_DESCRIPTION"
    "changenote" "$WORKSHOP_CHANGENOTE"
}
EOF

steamcmd \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +workshop_build_item /home/steam/workshopitem.vdf \
    +quit
