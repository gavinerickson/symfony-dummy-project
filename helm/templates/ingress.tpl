{{- define "ingress.template" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .service.name | quote }}
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  ingressClassName: nginx
    rules:
      - host: {{ .service.host | quote }}
      http:
        paths:
          - pathType: Prefix
          backend:
            service:
              name: {{ .service.name | quote }}
              port:
                number: {{ .service.port }}
          path: /
{{- end -}}
