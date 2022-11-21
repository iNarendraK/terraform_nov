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
