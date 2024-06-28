.PHONY: k8s
k8s: /opt/homebrew/bin/aws-sso
k8s: /opt/homebrew/bin/az
k8s: /opt/homebrew/bin/kubeconform
k8s: /opt/homebrew/bin/kubelogin
k8s: /opt/homebrew/bin/kubie
k8s: /opt/homebrew/bin/helm

/opt/homebrew/bin/kubie:
	brew install kubie

/opt/homebrew/bin/kubeconform:
	brew install kubeconform

/opt/homebrew/bin/helm:
	brew install helm
	helm plugin install https://github.com/databus23/helm-diff
	helm plugin install https://github.com/helm-unittest/helm-unittest.git
	helm plugin install https://github.com/helm-unittest/helm-unittest.git
	helm plugin install https://github.com/jkroepke/helm-secrets
	helm plugin install https://github.com/jtyr/kubeconform-helm
