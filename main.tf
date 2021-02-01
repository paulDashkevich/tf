terraform {
  required_providers {
    ah = {
      source = "advancedhosting/ah"
      version = "0.1.3"
    }
    
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }  

  }
}

provider "ah" {
	access_token = "1xvZdwryhcdhFsN4rh8aU1hE"
}

resource "ah_cloud_server" "nginx" {
   name         	    = "nginx"
   image        	    = "centos-7-x64"
   datacenter   	    = "ams1"
   product		    = "start-xs"
   create_public_ip_address = false   
   ssh_keys                 = ["f2:64:47:ba:f4:26:5d:a8:da:75:be:b3:34:e8:bf:4a"] 
}

resource "ah_ip" "nginx" {
  type       = "public"
  datacenter = "ams1"
}

resource "ah_ip_assignment" "nginx" {
  cloud_server_id = ah_cloud_server.nginx.id
  ip_address      = ah_ip.nginx.id
}

provider "ansible"{
}

resource "null_resource" "nginx" {
provisioner "local-exec" {
    command = "sleep 100; ansible-playbook ./provision/playbook.yml"
  }
}



