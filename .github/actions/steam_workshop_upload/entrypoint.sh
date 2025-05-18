#!/bin/bash

cat > workshopitem.vdf << EOF
"workshopitem"
{
    "appid" "${{ inputs.GAME_ID }}"
    "publishedfileid" "${{ inputs.MOD_ID }}"
    "contentfolder" "${{ inputs.MOD_CONTENT_PATH }}"
    "previewfile" "${{ inputs.WORKSHOP_THUMBNAIL_PATH }}"
    "visibility" "${{ inputs.WORKSHOP_VISIBILITY }}"
    "title" "${{ inputs.WORKSHOP_TITLE }}"
    "description" "${{ inputs.WORKSHOP_DESCRIPTION }}"
    "changenote" "${{ inputs.WORKSHOP_CHANGENOTE }}"
}
EOF

cat workshopitem.vdf

steamcmd \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +workshop_build_item /home/steam/workshopitem.vdf \
    +quit
