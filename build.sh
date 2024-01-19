ansible-builder create --output-filename Dockerfile
gsed -i 's/FROM/FROM --platform=linux\/amd64/' context/Dockerfile
export REGISTRY=quay.io/sriramgaddipati
cd context/
docker buildx build --no-cache --platform linux/arm64,linux/amd64 --build-arg ANSIBLE_GALAXY_SERVER_AUTOMATION_HUB_TOKEN=$ANSIBLE_GALAXY_SERVER_AUTOMATION_HUB_TOKEN -t $REGISTRY/cloud-ee:latest --push .