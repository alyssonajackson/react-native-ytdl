#!/bin/sh

# fetches latest source code of node-ytdl-core release
TMP_DIR="__AUTO_PATCHER__/tmp/"
mkdir "${TMP_DIR}"

ZIPBALL_SOURCE_URL=$(curl -sL https://api.github.com/repos/distubejs/ytdl-core/tags?per_page=1 | jq -r '.[0].zipball_url')
ZIPBALL_DEST_FILE="${TMP_DIR}/ytdl-core.zip"

echo "Downloading from: \"${ZIPBALL_SOURCE_URL}\" to \"${ZIPBALL_DEST_FILE}\""
curl -L -o "${ZIPBALL_DEST_FILE}" "${ZIPBALL_SOURCE_URL}" &&

echo "Finished downloading"

ZIPBALL_EXTRACT_DIR="${TMP_DIR}ytdl-core/"
mkdir "${ZIPBALL_EXTRACT_DIR}"
echo "Extracting \"${ZIPBALL_DEST_FILE}\" to \"${ZIPBALL_EXTRACT_DIR}\""
unzip -o "${ZIPBALL_DEST_FILE}" -d "${ZIPBALL_EXTRACT_DIR}"
SOURCE_DIR=$(echo ${ZIPBALL_EXTRACT_DIR}distubejs-ytdl-core*/)
echo ${SOURCE_DIR} &&
mv ${SOURCE_DIR}* "${ZIPBALL_EXTRACT_DIR}" &&
rm -r "${SOURCE_DIR}"

echo "Finished extracting"
