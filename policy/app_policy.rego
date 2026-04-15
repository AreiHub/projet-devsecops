package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot
  msg = "Erreur de sécurité : Le déploiement doit avoir 'runAsNonRoot: true'"
}