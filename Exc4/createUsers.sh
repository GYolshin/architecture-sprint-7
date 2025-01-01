mkdir cert && cd cert
openssl genrsa -out user1.key 2048
openssl genrsa -out user2.key 2048

openssl req -new -key user1.key -out user1.csr -subj "/CN=user1/O=group1"
openssl req -new -key user2.key -out user2.csr -subj "/CN=user2/O=group1"


openssl x509 -req -in user1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out user1.crt -days 500
openssl x509 -req -in user2.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out user2.crt -days 500