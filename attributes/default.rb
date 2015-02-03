#
# Cookbook Name:: db
#
# Copyright RightScale, Inc. All rights reserved.
# All access and use subject to the RightScale Terms of Service available at
# http://www.rightscale.com/terms.php and, if applicable, other agreements
# such as a RightScale Master Subscription Agreement.

# Required attributes

# Default setting for DB FQDN
default[:db][:dns][:master][:fqdn] = "localhost"
# Database master DNS record ID
default[:db][:dns][:master][:id] = ""
# Database slave DNS record ID
default[:db][:dns][:slave][:id] = ""
# Database admin user
default[:db][:admin][:user] = "root"
# Database admin password
default[:db][:admin][:password] = ""
# Database replication user
default[:db][:replication][:user] = ""
# Database replication password
default[:db][:replication][:password] = ""
# Database application username
default[:db][:application][:user] = ""
# Database application password
default[:db][:application][:password] = ""
# Database provider type
default[:db][:provider_type] = ""
# Database backup lineage
default[:db][:backup][:lineage] = ""

# Optional attributes

# Database slave FQDN
default[:db][:dns][:slave][:fqdn] = ""
# Database replication network interface
default[:db][:replication][:network_interface] = "private"
# Initialize slave at boot
default[:db][:init_slave_at_boot] = "false"
# TTL limit to verify Master DB DNS TTL
default[:db][:dns][:ttl] = "60"
# Database backup lineage override
default[:db][:backup][:lineage_override] = ""
# Database backup timestamp override
default[:db][:backup][:timestamp_override] = ""


# Initial settings for client operations on application servers
default[:db][:data_dir] = "/mnt/storage"

# Database driver class to be used based on the type of driver
default[:db][:client][:driver] = ""

# Server state variables
#
# Default value for DB status
# valid values are :initialized or :uninitialized
default[:db][:init_status] = :uninitialized

# Default value for DB master/slave check
default[:db][:this_is_master] = false

# Instance UUID and ip default values
default[:db][:current_master_uuid] = nil
default[:db][:current_master_ip] = nil


# By default master should not do automated backups.
default[:db][:backup][:primary][:master][:cron][:hour] = ""
default[:db][:backup][:primary][:master][:cron][:minute] = ""
default[:db][:backup][:secondary][:master][:cron][:hour] = ""
default[:db][:backup][:secondary][:master][:cron][:minute] = ""

# Calculate recommended backup times for slave
#
# Randomly set the slave backup time. This is done to prevent overloading
# the API and cloud providers. If every rightscale server sent a request
# at the same time to perform a snapshot it would be a huge usage spike.
# The random start time evens out these spikes.

# Primary slave backup.
#
# Slave backup every hour at a random minute.
default[:db][:backup][:primary][:slave][:cron][:hour] = "*"
default[:db][:backup][:primary][:slave][:cron][:minute] = rand(60)

# Secondary slave backup.
#
# Slave backup daily at a random hour and a random minute
default[:db][:backup][:secondary][:slave][:cron][:hour] = rand(24)
default[:db][:backup][:secondary][:slave][:cron][:minute] = rand(60)

# DB manager type specific commands array for db_sys_info.log file
default[:db][:info_file_options] = []
default[:db][:info_file_location] = "/etc"
