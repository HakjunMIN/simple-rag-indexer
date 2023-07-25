 #!/bin/sh

echo 'Running "prepdocs-advanced.py" using Form Recognizer, then uploading to Blob Storage'
python3 ./prepdocs.py './data/*' \
    --tenantid "$AZURE_TENANT_ID" \
    --searchservice "$AZURE_SEARCH_SERVICE" \
    --searchkey "$AZURE_SEARCH_SERVICE_KEY" \
    --index "$AZURE_SEARCH_INDEX" \
    --openaiservice "$AZURE_OPENAI_SERVICE" \
    --openaideployment "$AZURE_OPENAI_EMB_DEPLOYMENT" \
    --openaikey "$AZURE_OPENAI_API_KEY" \
    --storageaccount "$AZURE_STORAGE_ACCOUNT" \
    --container "$AZURE_STORAGE_CONTAINER" \
    --storagekey "$AZURE_STORAGE_ACCOUNT_KEY" \
    --formrecognizerservice "$AZURE_FORMRECOGNIZER_SERVICE" \
    --formrecognizerkey "$AZURE_FORMRECOGNIZER_KEY" \
    -v