# Blender cluster on kubernetes

This deploys the blender cluster image on kubernetes as a StatefulSet.

## Deployment

Create a basic auth secret first:

```bash
$ htpasswd -c .htpasswd MY_USERNAME
$ base64 -i .htpasswd

# copy output of ^
# create a secret.yml
$ cat <<EOF >secret.yml
apiVersion: v1
kind: Secret
metadata:
  name: blender-master-auth
  namespace: blender-render
data:
  auth: INSERT_BASE64_STRING_HERE
type: Opaque

EOF
```

Start deployment:

```
$ DOMAIN="blender-cluster.example.net" ./deploy.sh
```

After a while, open https://blender-cluster.example.net. You should be able to see the master node with it's web-app.