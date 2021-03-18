# OpenShift cli + kubectl + tekton cli basic dockerfile

Basic dockerfile with k8s ocp and tkn tools.
Used to cleanup tekton pipelines
with something like that:

<pre>
#!/bin/bash
export PATH=$PATH:/usr/local/bin
TOKEN=$( cat /run/secrets/kubernetes.io/serviceaccount/token )

/usr/local/bin/oc login --token=$TOKEN https://kubernetes.default.svc
/usr/local/bin/oc project $NAMESPACE

for pod in $(/usr/local/bin/tkn pipelinerun list | awk '/[2-9] days ago.*(Cancelled|Succeeded|Failed)/ { print $1 }'); do
  /usr/local/bin/tkn pipelinerun delete ${pod} --force > /dev/null
done
# EOF
<pre>
