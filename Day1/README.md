# Day 1 

## In case you haven't already cloned this repository
```
cd ~
git clone https://github.com/tektutor/terraform-nov-2022.git
```

## Your first Terraform Script
```
cd ~
cd terraform-nov-2022/Day1/lab1

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
jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ ls -lha
total 20K
drwxrwxr-x 3 jegan docker 4.0K Nov 21 01:08 .
drwxrwxr-x 3 jegan docker 4.0K Nov 21 00:55 ..
-rw-rw-r-- 1 jegan docker  397 Nov 21 01:08 main.tf
drwxr-xr-x 3 jegan docker 4.0K Nov 21 01:08 .terraform
-rw-r--r-- 1 jegan docker 1.4K Nov 21 01:08 .terraform.lock.hcl

jegan@tektutor.org:~/terraform-nov-2022/Day1/lab1$ tree .terraform
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

  Enter a value: yes

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
