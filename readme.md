# Command for Setting up Airflow & Mlflow Service in Linux 2 in Amazon EC2

## 1. Command from Local to EC2
### 1.1. Establish EC2 connection
```
ssh -i {path of private key} ec2-user@{Public IPv4 DNS}
```
### 1.2. Transfer files from Local to EC2
```
ssp -i {path of private key} {local path} ec2-user@{Public IPv4 DNS}: {ec2 path}
```

## 2. Update & Install Packages
### 2.1. Update yum
```
sudo yum update
```
### 2.2. Install docker
```
sudo yum install docker
```

## 3. Add Group Membership
```
sudo usermod -a -G docker ec2-user
id ec2-user
# Reload a Linux user's group assignments to docker w/o logout
newgrp docker
```

## 4. Install docker-compose
```
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose
```

## 5. Commands for Docker Service
Starting docker service by
```
sudo systemctl start docker.service
```
Below are the commands for docker service
```
sudo systemctl start docker.service #<-- start the service
sudo systemctl stop docker.service #<-- stop the service
sudo systemctl restart docker.service #<-- restart the service
sudo systemctl status docker.service #<-- get the service status
```

## 6. Preparing docker-compose.yaml
My file is referenced from [docker-compose.yaml](https://airflow.apache.org/docs/apache-airflow/2.6.0/docker-compose.yaml)

## 7. Setting up Airflow User
```
mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

## 8. Initialize Database
```
docker-compose --env-file env.list up airflow-init
```

## 9. Running Airflow & Mlflow
```
docker-compose --env-file env.list up
```

## 10. Others
### 10.1. Clean all docker images
```
docker system prune -a
```

## Reference
1. [How to install Docker on Amazon Linux 2](https://www.cyberciti.biz/faq/how-to-install-docker-on-amazon-linux-2/)
2. [Running Airflow in Docker](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html)