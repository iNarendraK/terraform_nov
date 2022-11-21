# Day 1 

## In case you haven't already cloned this repository
```
cd ~
git clone https://github.com/tektutor/terraform-nov-2022.git
```

## ⛹️‍♂️ Lab - Your first Terraform Script
```
cd ~
cd terraform-nov-2022
git pull

cd Day1/lab1
terraform init
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform init</b>

Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "2.23.0"...
- Installing kreuzwerker/docker v2.23.0...
- Installed kreuzwerker/docker v2.23.0 (self-signed, key ID BD080C4571C6104C)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "2.23.0"...
- Installing kreuzwerker/docker v2.23.0...
- Installed kreuzwerker/docker v2.23.0 (self-signed, key ID BD080C4571C6104C)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
</pre>

When we perform terraform init, it will install all the missing terraform providers mentioned in the main.tf under a hidden folder called .terraform
```
ls -lha
tree .terraform
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>ls -lha</b>
total 20K
drwxrwxr-x 3 jegan docker 4.0K Nov 21 01:08 .
drwxrwxr-x 3 jegan docker 4.0K Nov 21 00:55 ..
-rw-rw-r-- 1 jegan docker  397 Nov 21 01:08 main.tf
drwxr-xr-x 3 jegan docker 4.0K Nov 21 01:08 .terraform
-rw-r--r-- 1 jegan docker 1.4K Nov 21 01:08 .terraform.lock.hcl

jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>tree .terraform</b>
.terraform
└── providers
    └── registry.terraform.io
        └── kreuzwerker
            └── docker
                └── 2.23.0
                    └── linux_amd64
                        ├── CHANGELOG.md
                        ├── LICENSE
                        ├── README.md
                        └── terraform-provider-docker_v2.23.0

6 directories, 4 files
</pre>

Let's execute the terraform script now
```
terraform apply
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform apply</b>

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my-nginx"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      + ports {
          + external = 9000
          + internal = 8080
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "bitnami/nginx:latest"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: <b>yes</b>

docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 10s [id=sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=9193357c9f4c251d1c5e97ad69f2a003cfdfadb1e4a05ed6382b6374ce9dba95]
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
</pre>

You may check if terraform has download the bitnami/nginx image and created a container named my-nginx
```
docker images
docker ps
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>docker images</b>
REPOSITORY      TAG       IMAGE ID       CREATED       SIZE
bitnami/nginx   latest    2f8cd4fa21bb   7 hours ago   95.5MB
nginx           latest    88736fe82739   5 days ago    142MB
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>docker ps</b>
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                              NAMES
9193357c9f4c   2f8cd4fa21bb   "/opt/bitnami/script…"   22 seconds ago   Up 21 seconds   8443/tcp, 0.0.0.0:9000->8080/tcp   my-nginx
</pre>


## ⛹️‍♂️ Lab - Creating a plan before applying changes
```
cd ~/terraform-nov-2022
git pull
cd Day1/lab1

terraform plan --out main.tfplan
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform plan --out main.tfplan</b>

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my-nginx"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      + ports {
          + external = 9000
          + internal = 8080
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "bitnami/nginx:latest"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: main.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "main.tfplan"
</pre>


## ⛹️‍♂️ Lab - Executing the plan
```
terraform plan --out main.tfplan
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform apply main.tfplan</b>
docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 11s [id=sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=25b39ec8fc030cea97a537d1b938de8ea996d9e6b29b1acbb5b2d880e2de128b]
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
</pre>

## ⛹️‍♂️ Lab - Destroying all resources created by your Terraform Project
```
cd ~/terraform-nov-2022
git pull
cd Day1/lab1
terraform destroy
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform destroy</b>
docker_image.nginx: Refreshing state... [id=sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest]
docker_container.nginx: Refreshing state... [id=25b39ec8fc030cea97a537d1b938de8ea996d9e6b29b1acbb5b2d880e2de128b]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "/opt/bitnami/scripts/nginx/run.sh",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/opt/bitnami/scripts/nginx/entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - gateway                                     = "172.17.0.1" -> null
      - group_add                                   = [] -> null
      - hostname                                    = "25b39ec8fc03" -> null
      - id                                          = "25b39ec8fc030cea97a537d1b938de8ea996d9e6b29b1acbb5b2d880e2de128b" -> null
      - image                                       = "sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33" -> null
      - init                                        = false -> null
      - ip_address                                  = "172.17.0.2" -> null
      - ip_prefix_length                            = 16 -> null
      - ipc_mode                                    = "private" -> null
      - links                                       = [] -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "my-nginx" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> null
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - user                                        = "1001" -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
      - working_dir                                 = "/app" -> null

      - ports {
          - external = 9000 -> null
          - internal = 8080 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest" -> null
      - image_id     = "sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33" -> null
      - keep_locally = false -> null
      - latest       = "sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33" -> null
      - name         = "bitnami/nginx:latest" -> null
      - repo_digest  = "bitnami/nginx@sha256:a13a99b81152f5274c8fdcd621d47f441b230ea4dea45acd48f23877949230de" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.
╷
│ Warning: Deprecated attribute
│ 
│   on main.tf line 18, in resource "docker_container" "nginx":
│   18:   image = docker_image.nginx.latest
│ 
│ The attribute "latest" is deprecated. Refer to the provider documentation for details.
╵

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: <b>yes</b>

docker_container.nginx: Destroying... [id=25b39ec8fc030cea97a537d1b938de8ea996d9e6b29b1acbb5b2d880e2de128b]
docker_container.nginx: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest]
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
</pre>

## Lab - Using auto-approve
```
cd ~/terraform-nov-2022
git pull
cd Day1/lab1

terraform apply --auto-approve
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ <b>terraform apply --auto-approve</b>

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my-nginx"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

      + ports {
          + external = 9000
          + internal = 8080
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "bitnami/nginx:latest"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 13s [id=sha256:2f8cd4fa21bb2ca1b1a88a7674f85253ff1676e25cf645465ef5314bcd118b33bitnami/nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=5b47c83b2eb80cdc39ed58191a53819ae1f9f3d365d0d3204b777a1ccc0daac2]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
</pre>
