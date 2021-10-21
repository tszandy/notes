# Jenkin plugin
# Administration plugins
service authentication
audit trail and general security
node and job-related management

# User Interface (UI) plugins
Customizing the view tabs ,menu, and dropdowns 
Formatting text, and even images
Email templates

# Source Code Management (SCM) plugins
Allow Jenkins to run version control systems such as Git, Mercurial, and SCM
Allow Jenkins to pull code from version control hosts, such as GitHub, Bitbucket, GitLab, and so on.
Authenticate Jenkins to pull from both private and public version control hosts.

# Build Management Plugins 
Allow Jenkins to trigger notifications on build failure or pass
Manage build artifacts
Trigger deploys or other custom build steps

# logging framework
ELK(ElasticSearch,LogStash, and Kibana)
Graylog

# Improving Memory Management
To handle too much logs, On unix servers, you can enable log rotation. 
second option, set up backup database or datastores such as :
Amazon S3
Cassandra
Postgres/MongoDB(self-hosted)
Google's Cloud storage

Due to connectivity issues, if the restart loops infinitely, run a safe restart.
localhost:8080/safeRestart



