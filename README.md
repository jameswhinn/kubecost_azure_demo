# POC demonstrating kubecost ability to report on costs per namespace utilisation 

## USAGE

``` terraform init```

```terraform apply```

```cd resources && ./kubecost.sh```

## Generate load

```helm install -n fedex1 load-gen --name load-gen --set replicaCount=2```