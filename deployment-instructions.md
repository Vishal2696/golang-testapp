**Terraform Deployment:**
1. Navigate into `terraform-templates` directory and open the file `values` using your preferrable editor.
2. Replace `entervaluehere` with your own values in every place. Description for each variable is listed below. 
```
postgres_adminusername = Admin Username for the Postgres RDS database
postgres_adminpassword = Password for the admin user of the postgres RDS database
database_name = Name of the database to be used by the application inside RDS
rds_publicaccess = boolean value to decide whether RDS should be publicly accessible or not. Valid values are "true" or "false"
kubernetes_version = Version of kubernetes for the control plane
```
3. Run the command `terraform init`. 
4. Run the command `terraform plan -out plan01 -var-file values`
5. Once the previous command completes successfully, run the command `terraform apply "plan01"`
6. The deployment takes around 20 to 30 minutes with EKS and RDS taking the longest time for creation. Once the deployment is completed successfully, the RDS endpoint is displayed. Note the URL down without the port number as we will need it in the next steps. 
```
Sample output:
rds_access_endpoint = rds-apptest01.XXXXXXX.ap-south-1.rds.amazonaws.com:5432
```

**Kubernetes Deployment:**
1. Navigate to `kubernetes-yamls` directory and open the file `secret.yaml` with your preferred editor.
2. Replace the `enter_value_here` with the values you used in the `values` file during terraform deployment. All values to be entered inside the double-quotes 
```
dbuser = Same value used for postgres_adminusername
dbpassword = Same value used for postgres_adminpassword
dbname = Same value used for database_name
dbhost = Paste the rds endpoint url here which was displayed at the end of terraform deployment
```
3. Now connect to the kubernetes cluster using below aws-cli command.
`aws eks --region ap-south-1 update-kubeconfig --name eks-aps1-terraform`
4. Check your connection kubernetes using the below command. It should display a list of all pods running in the cluster. 
`kubectl get pods -A`
5. Once successfully connected to the cluster, enter the below commands in the same order one after another.
```
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
```
6. Check whether the pod is running using the following command `kubectl get po -n default`
```
Sample Output:
NAME                    READY   STATUS    RESTARTS   AGE
serviantest-<podhash>   1/1     Running   0          26s

```
7. Once the pod is runnning, enter the following command `kubectl apply -f service.yaml`
8. Check whether the service was created successfully using the command `kubectl get svc -n default`
```
Sample Output:
NAME              TYPE           CLUSTER-IP      EXTERNAL-IP                                                                PORT(S)        AGE
kubernetes        ClusterIP      172.20.0.1      <none>                                                                     443/TCP        43m
servian-service   LoadBalancer   172.20.106.60   <bigautomatedhasg>.ap-south-1.elb.amazonaws.com                            80:32622/TCP   16s

```
9. Wait for 5 minutes and then copy the URL displayed under the `EXTERNAL-IP` and load it in the browser. The home page of the app will load in a second or two.
