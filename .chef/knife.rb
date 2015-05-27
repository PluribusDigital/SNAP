#berkshelf_path										'kitchen'
#cookbook_path    									['~/.berkshelf/cookbooks', 'kitchen/site-cookbooks']
#data_bag_path    									'kitchen/data_bags'
#encrypted_data_bag_secret 							'.databag_secret'
#environment_path 									'kitchen/environments'
#node_path        									'kitchen/nodes'
#role_path       									'kitchen/roles'
ssl_verify_mode 									:verify_peer

#knife[:aws_credential_file] =    '/path/to/credentials/file/in/above/format'
knife[:aws_credential_file] =     '/vagrant/aws_credentials.txt'
knife[:flavor] =                  'm3.medium'
knife[:image] =                   'ami-5b6c8b30'
knife[:region] =                  'us-east-1'
knife[:availability_zone] =       'us-east-1b'
knife[:solo] =                    true
#knife[:aws_ssh_key_id] =          '/path/to/pem/file/without/extension'    
knife[:aws_ssh_key_id] =          'default-dev'     