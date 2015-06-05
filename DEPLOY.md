#AWS Deployment
These instructions describe how to deploy the SNAP application to Amazon Web Services (AWS).  Deployment to AWS is a two step process.  The first step launches an EC2 instance that has all the applications (nginx, passenger, ruby, postgresql, etc.) required to run the SNAP application but does not have SNAP installed yet. The second step uses Capistrano to deploy SNAP to the EC2 instance.

##Prerequisites
- An AWS account
- Your AWS access key ID and secret key.  You should have saved these when you created your account or whoever is managing your team's AWS access should have supplied them.
- Our team's default development private key file (default-dev.pem) which should have been sent to you.  This is a key that is shared amongst developers so that we can ssh into each others EC2 instances.  If you would like to keep your instances private you can create your own key pair via the AWS console (see [AWS Key Pairs]).  If you choose to do this you'll need to substitute your private key file wherever default-dev.pem is referenced in these instructions.
- You'll need to save  the development private key onto the machine from which you'll be deploying from.
- The AWS security group tied to our EC2 instances has been configured to only allow access from our headquarter's subnet.  If you are not working from this subnet you'll need to add your IP address to our dev security group or create and use a new security group for deployment (see [AWS Security Groups]).

##Deployment Steps
1. Run the following to install the gems required for deployment:
 
 ```sh
   bundle install
   ```

   If you're only interested in deployment and not development you can reduce the gems required with:
   ```sh
   bundle install --without development test production staging
   ```
   
2. Set AWS environment variables

   ```sh
   export AWS_CREDENTIALS_FILE=/path/to/aws_credentials_file
   export AWS_KEY=/path/to/default-dev.pem
   ```
   
3. Bring up an EC2 instance using knife.

   ```sh
   knife ec2 server create \
     --groups=dev \
     --ssh-user=ec2-user \
     --ssh-key=default-dev \
     --identity-file=${AWS_KEY} \
     --node-name=select_a_server_name
   ```
   
   Answer yes when prompted to accept the authenticity of an unknown host.
   After knife is finished make note of the returned "Public DNS Name". 
4. Set EC2 instance environment variable

   ```sh
   export APP_SERVER="The public dns name of the ec2 instance that was just created"
   ```
   
5. Deploy SNAP to your EC2 instance

   ```sh
   cap demo deploy
   ```

If everything succeeded the SNAP application should be available using the public DNS name assigned to your EC2 instance.

Capistrano deployments (step 5) can be run multiple times on a single Ec2 instance.  Previous SNAP versions will simply be replaced.



[AWS Key Pairs]:http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
[AWS Security Groups]:http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html#adding-security-group-rule