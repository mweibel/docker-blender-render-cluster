#!/bin/bash
kubectl create secret -n blender-render docker-registry gitlab-auth --docker-server=https://registry.gitlab.com --docker-username=$USERNAME --docker-password=$PASSWORD --docker-email=$EMAIL
