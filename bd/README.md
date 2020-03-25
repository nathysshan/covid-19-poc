Liens vers les templates BD Openshift : 
https://github.com/openshift/origin/tree/master/examples/db-templates

Créer une nouvelle application, en applicant le template :

`oc new-app -f template-mysql-persistent.json`

Output : 
``` bash
--> Deploying template "boyce-mysql-poc/mysql-persistent" for "template-mysql-persistent.json" to project boyce-mysql-poc

     MySQL
     ---------
     MySQL database service, with persistent storage. For more information about using this template, including OpenShift considerations, see https://github.com/sclorg/mysql-container/blob/master/5.7/root/usr/share/container-scripts/mysql/README.md.

     NOTE: Scaling to more than one replica is not supported. You must have persistent volumes available in your cluster to use this template.

     The following service(s) have been created in your project: mysql.

            Username: userOYT
            Password: ------
       Database Name: sampledb
      Connection URL: mysql://mysql:3306/

     For more information about using this template, including OpenShift considerations, see https://github.com/sclorg/mysql-container/blob/master/5.7/root/usr/share/container-scripts/mysql/README.md.

     * With parameters:
        * Memory Limit=512Mi
        * Namespace=openshift
        * Database Service Name=mysql
        * MySQL Connection Username=userOYT # generated
        * MySQL Connection Password=------ # generated
        * MySQL root user Password=------ # generated
        * MySQL Database Name=sampledb
        * Volume Capacity=1Gi
        * Version of MySQL Image=5.7        

--> Creating resources ...
    secret "mysql" created
    service "mysql" created
    persistentvolumeclaim "mysql" created
    deploymentconfig.apps.openshift.io "mysql" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/mysql'
    Run 'oc status' to view your app.
```
Lister les ressources d'un projet : 

`oc get all -o name`

Output : 
``` bash
pod/mysql-1-deploy
pod/mysql-1-n26pf
replicationcontroller/mysql-1
service/mysql
deploymentconfig.apps.openshift.io/mysql
```

Se connecter au container : 

`oc rsh pod/mysql-1-n26pf`
