# TFSec

_TFSec_ es una herramienta de análisis estático de seguridad para Terraform. Revisa archivos .tf en busca de configuraciones inseguras.

**Características:**
- Analiza código Terraform (HCL) sin ejecutarlo.
- Detecta configuraciones peligrosas: puertos abiertos, cifrado ausente, políticas excesivas, etc.
- Compatible con Terraform nativo, sin necesidad de terraform init.
- Integración con CI/CD (GitHub Actions, GitLab CI, Jenkins, etc.).
- Soporta reglas personalizadas.

