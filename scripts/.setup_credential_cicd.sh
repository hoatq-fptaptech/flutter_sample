GREEN='\033[1;32m'

echo "${GREEN}========================Setup Credential CICD Start======================="

#Use to write authenticate content to env file for fastlane ios authenticate
echo "$APP_STORE_CONNECT_TOKEN" | base64 -d > fastlane/app_store_connect_token.json
echo "$CREDENTIAL_ANDROID" | base64 -d > android/google_credential_ci.json
echo "$KEY_PROPERTIES_BASE64" | base64 -d > android/key.properties
echo "$KEY_STORE_BASE64" | base64 -d > android/app/upload-keystore.jks

echo "${GREEN}========================Setup Credential CICD Finish======================="
