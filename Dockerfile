FROM alpine:3.9

ARG KUBECTL_VERSION=v1.14.1
ARG TERRAFORM_VERSION=0.11.14

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin
RUN chmod +x /usr/local/bin/kubectl

RUN apk add --no-cache \
      curl \
      ca-certificates \
      git

# Install terraform
RUN cd /tmp \
    && curl -sL -o terraform.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip \
    && unzip terraform.zip \
    && rm -rf terraform.zip \
    && mv terraform /usr/bin/terraform
