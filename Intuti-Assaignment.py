import os
os.system('ls -ltr')
os.system('git clone https://github.com/srimul/intuti;cd intuti/env/dev;terraform init')
os.system('terraform plan')
os.system('terraform apply -auto-approve')
os.system('cd ../../Intuit-Ansible/')
os.system('python3 convert.py')
os.system('ansible -m ping all')
os.ststem('ansible play-book installjdk.yml')
os.ststem('ansible play-book installnginx.yml')
os.system('curl helloworld.com')
os.ststem('ansible play-book installtomcat8.yml')
os.system('echo "Test tomcat locally"')
os.ststem('ansible play-book helloworld-deploy.yml')
os.ststem('ansible play-book reverseproxy.yml')
os.system('curl helloworld.com')
