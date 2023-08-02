import os
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
from azure.identity import ClientSecretCredential

# Set the connection string and container name
connect_str = os.environ.get('AZURE_READ_STORAGE_CONNECTION_STRING')
container_name = os.environ.get('AZURE_READ_STORAGE_CONTAINER_NAME')

# Create the BlobServiceClient object with key credential
blob_service_client = BlobServiceClient.from_connection_string(connect_str)

# Get the container client object
container_client = blob_service_client.get_container_client(container_name)

# List all blobs in the container
blob_list = container_client.list_blobs()

# Download each blob to the /data folder
for blob in blob_list:
    # Get the blob client object
    blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob.name)

    # Download the blob to the /data folder
    download_path = os.path.join('./data', blob.name)
    os.makedirs(os.path.dirname(download_path), exist_ok=True)
    with open(download_path, "wb") as my_blob:
        download_stream = blob_client.download_blob()
        my_blob.write(download_stream.readall())