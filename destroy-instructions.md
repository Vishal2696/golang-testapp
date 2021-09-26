**Kubernetes Components Destruction:**
1. First step should be to destroy the kubernetes service. Failing to do this and proceeding to `terraform destroy` will result in failure as there will be a load balancer preventing terraform from completely destroying all the resources. Run the below command to avoid this scenario. 
```
kubectl delete service servian-service
```
2. Delete the deployment and secrets using the below commands. This step can be skipped but I would advise not to. 
```
kubectl delete deployment serviantest
kubectl delete secret appenvs
```

**Terraform Destruction:**
1. Navigate to the directory where you entered the command `terraform apply "plan01"`. This should ideally be the `terraform-templates` directory if you had followed the `deployment-instructions.md` file correctly.
2. Enter the command `terraform destroy -var-file values` and enter `yes` for the following prompt. 
3. The destroy process will begin and go on for 15 to 20 minutes.
