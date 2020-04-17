gcloud config set compute/zone asia-east1-a

gcloud config set compute/region asia-east1

gcloud compute instance-templates create tmp-aspnet-debian \
    --image-family=debian-9 \
    --image-project=debian-cloud \
    --machine-type=g1-small \
    --scopes userinfo-email,cloud-platform \
    --metadata-from-file startup-script=gce-startup.sh \
    --tags lottery

gcloud compute target-pools create pool-aspnet

gcloud compute instance-groups managed create group-aspnet \
    --base-instance-name aspnet \
    --size 2 \
    --template tmp-aspnet-debian \
    --target-pool pool-aspnet

gcloud compute forwarding-rules create lb-aspnet \
            --ports 80 \
            --region asia-east1 \
            --target-pool pool-aspnet