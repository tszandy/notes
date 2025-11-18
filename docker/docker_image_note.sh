# load balance server
nginx:alpine

# ubuntu base image
ubuntu:24.10
ubuntu:22.04
ubuntu:18.04

# debian
debian:12
debian:11
debian:10

# gitlab 
gitlab/gitlab-ee:latest
gitlab/gitlab-ce:latest

# solr search engine Apache Solr is the popular, blazing-fast, open source search platform built on Apache Lucene™.
solr
solr:8.5.2
solr:9.9.0
solr:latest

# CI/CD 
jenkins/jenkins:lts
jenkins/jenkins:latest

# kali linux
kalilinux/kali-last-release
kalilinux/kali-rolling
kalilinux/kali

# Vector database Milvus
bitnami/milvus:2.4.2-debian-12-r1

# mongo database
mongo:latest

# Apollo GraphQL Server

# go image
golang:1.21.3

# registry image
registry:latest

# elstic search
elasticsearch:8.13.4

# Logstash is a tool for managing events and logs.
logstash:8.13.4

# NATS is an open-source, high-performance, cloud native messaging system.
nats:scratch

# graph database Neo4j is a highly scalable, robust native graph database.
neo4j:ubi9

# API Gateway The Cloud-Native API Gateway for APIs and Microservices
kong:latest

# MongoDB admin interface, Web-based MongoDB admin interface, written with Node.js and express
mongo-express:latest

# Kibana gives shape to any kind of data — structured and unstructured — indexed in Elasticsearch.
kibana:8.13.4

# open-source business apps Odoo (formerly known as OpenERP) is a suite of open-source business apps.
odoo:latest

# scalable graph database system ArangoDB - a scalable graph database system to drive value from connected data, faster.
arangodb:latest

# The Robot Operating System (ROS) is an open source project for building robot applications.
ros:latest

# Redis is an open source key-value store that functions as a data structure server.
redis:6
redis:7
redis:8
redis:latest

# The most scalable open-source MQTT broker for IoT, IIoT, connected vehicles, and more.
emqx:latest

# vector database
opensearchproject/opensearch:latest

# open source cached software
memcached:1.6
memcached:latest

# mysql
mysql:latest
mysql/mysql-server:8.0

# postgres
postgres:15
postgres:16
postgres:17
postgres:18
postgres:latest

# HashiCorp Vault - tool for managing secrets and protecting sensitive data
hashicorp/vault:latest

# JFrog Artifactory OSS is an open-source universal artifact repository manager for managing binaries and dependencies.
releases-docker.jfrog.io/jfrog/artifactory-oss:latest

# RabbitMQ is an open source message broker software that implements the Advanced Message Queuing Protocol (AMQP).
rabbitmq:latest
rabbitmq:3-management
rabbitmq:4-management
