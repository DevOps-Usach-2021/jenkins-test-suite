# Jenkins Test Suite

Instancia de Jenkins generada para el diplomado en DevOps 2021 de la USACH - Grupo 1.

# Qué incluye esta imagen

Esta imagen de contenedor incluye todos los recursos necesarios para cumplir con las pruebas necesarias para el Lab 4:

- Apache Maven
- Xvfb (Servidor de visualización destinado para pruebas)
- NPM
- Newman
- Google Chrome Stable
- Chrome Driver
- Selenium Server

# Ejecución

Simplemente genera un contenedor de esta imagen a través del siguiente comando:

```bash
docker run -d --name <nombre_contenedor> --rm -p <mapped_port>:8080 -v jenkins_home:/var/jenkins_home fgutierrezdocker/jenkins-test-suite:1.0
```

# Integrantes
- Luis Anguita
- Jesús Donoso
- Mario Friz
- Fernando Gutiérrez
- Oscar Mollo
- Carlos Tognarell
