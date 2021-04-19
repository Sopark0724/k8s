BRANCH_NAME="$(git name-rev --name-only HEAD | awk -F/ '{print $NF}')"
COMMIT_HASH="$(git rev-parse --verify HEAD | awk '{print substr($0,0,7)}')"

kubectl config set-credentials sharky.p --token=eyJhbGciOiJSUzI1NiIsImtpZCI6IlJZcUx1WExvZy15cmRyTGlIZ3ljNzNrbndCdENQSjctRGdzT25pcksxYlkifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrYWthby1zeXN0ZW0iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlY3JldC5uYW1lIjoic2hhcmt5LnAtdG9rZW4tc21uMmoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoic2hhcmt5LnAiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI4MzUxYTc1Ni00YTJjLTQzYTgtYWM1ZS05YzRhNDU0N2FmYWMiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a2FrYW8tc3lzdGVtOnNoYXJreS5wIn0.up9vqG9S4k3VLqgUWSoGcur7ph3a8AJIR5i3LpKqBO1QqKIsuLUZQvVAYHSpmom18TkpYNja2D_X8SHd22PWsc4MmUIzcGCsPscWOBqApq_5ULEI2sQyoMUDzYfUZFMFO1gd1Dxglh6JInbhStIooQW0MaFWZH8lxFCYPrHlihGiMURkyu_nbFuCC67pUIb8qfLi5-8b8jcddQfGdIjQMhdnDIbzRn2sBQqfn3pxQMoRUDfksDucGVJvdvk8jOmaG5RutiKRUEqBJlJT_KPFdoBTmvcSMK8HMZ-xJhlPY_NwNe8dNrFZoJlSPCVcZrNAWiHeakSA2wq0AMlqfew9sQ
kubectl config set-cluster dkos-study-cluster --insecure-skip-tls-verify=true --server https://dkosv3-dkos-study-master-1.ay1.krane.9rum.cc:6443
kubectl config set-context dkos-study-context --cluster=dkos-study-cluster --user=sharky.p
kubectl config use-context dkos-study-context

CLUSTER_NAME=$(kubectl config current-context | sed -e 's/-context$//')

helm upgrade --install $CLUSTER_NAME \
    --set deployPhase="prod" \
    --set clusterName="$CLUSTER_NAME" \
    --set docker.image.tag="latest" \
    --set tromm-pool-latest.api=http://sharky-study.dev.daum.net/test \
    ./deploy/helm/test



