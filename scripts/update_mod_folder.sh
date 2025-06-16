#!/bin/bash
# This script replaces your locally installed mod files with your currently
# written files, becuase you probably don't want to directly work inside
# the local mod folder with the whole repo.
# Just run it at the root folder of your repo.

# Adjust to your set-up if needed
LOCAL_MOD_PATH="/mnt/c/Program Files (x86)/Steam/steamapps/workshop/content/1158310/3479625504"

if [ -z "$LOCAL_MOD_PATH" ]; then
    echo "❌ Variable LOCAL_MOD_PATH is not set"
fi

echo "🗑️ Removing previous mod file contents at:"
echo "   $LOCAL_MOD_PATH"

if [ -d "$LOCAL_MOD_PATH" ]; then
    rm -r "$LOCAL_MOD_PATH"
fi

echo "📂 Copy new files"

cp -r mod "$LOCAL_MOD_PATH"

echo "✅ Updated local mod files"
