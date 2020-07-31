# Intuit-project
https://github.com/srimul/intuti
 
prerequisites:
Need a ec2 instances in the same public network with terraform, git, awscli(configured) and ansible installed.
------------ 
1. Create VPC with public and private subnets with vpc.tf
     code location:vpc.tf
2. Create two EC2 instances with terraform, one in public and one in private.
     code location: intuti/env/dev/
3. From step2 we will get the ipaddresses of the instances.
    here the ipaddress are converted into ansible host format by using convert.py
    code location: intuti/Intuit-Ansible/convert.py
4. Test ansible ping 
    ansible -m ping all
5. Install java using installjdk.yml
   Code location: intuti/Intuit-Ansible/installjdk.yml
   ansible-playbook installjdk.yml
6. Install nginx using installnginx.yml
    code location: intuti/Intuit-Ansible/installnginx.yml
7.  Configured route 53 with domain name helloworld.com
   access nginx by helloworld.com you will get the page "Hello World from nginx server 80"
8. Install tomcat8 using installtomcat8.yml   
   code location: intuti/Intuit-Ansible/installtomcat8.yml
9.  Test with wget at 8080 on private tomcat instance or public ngnix instance.
10. Deploy war file helloworld.war using helloworld-deploy.yml
    code location: intuti/Intuit-Ansible/helloworld-deploy.yml
11. Test locally with wget http://{{privatedns}}:8080/helloworld/index.jsp
12. Configure reverse proxy on nginx to route to helloworld application on tomcat server 
    code location: intuti/Intuit-Ansible/reverseproxy.yml
13. Access the helloworld.com application you will get response from helloworld.war file deployed on tomcat server.
