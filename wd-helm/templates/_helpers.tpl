{{/*
Expand the name of the chart.
*/}}
{{- define "wd-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wd-helm.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wd-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wd-helm.labels" -}}
app: {{ include "wd-helm.name" . }}
{{/* helm.sh/chart: {{ include "wd-helm.chart" . }}
{{ include "wd-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }} */}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wd-helm.selectorLabels" -}}
{{/* app.kubernetes.io/name: {{ include "wd-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }} */}}
app: {{ include "wd-helm.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "wd-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "wd-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
