# Evidencia

![image](https://github.com/user-attachments/assets/c0392a66-e374-4661-834d-ca6b236c18fb)

![image](https://github.com/user-attachments/assets/8b41f953-f510-4ba7-9e45-edbd0a178f96)

![image](https://github.com/user-attachments/assets/84870bee-c1b1-4ec0-a38d-38ec360a4e38)

![image](https://github.com/user-attachments/assets/bcb5a481-8856-4692-88d9-d798a1c3a920)

# Proyecto base de pruebas automatizadas con Karate, Java y Gradle

Este proyecto es una base para implementar pruebas automatizadas de la colección de peticiones entregadas (por ejemplo, una colección Postman). Todas las pruebas deben ser escritas en el archivo `src/test/resources/karate-test.feature` siguiendo la sintaxis de Karate DSL.

## Instrucciones de uso

### 1. Descarga del proyecto

Clona este repositorio en tu máquina local:

```sh
git clone https://github.com/dg-juacasti/test-automatisation-base
cd karate-test
```

### 2. Escribe tus pruebas

- Implementa los escenarios de prueba en el archivo:
  - `src/test/resources/karate-test.feature`
- Usa la sintaxis de Karate para definir los escenarios y validaciones.

### 3. Ejecuta las pruebas

Asegúrate de tener Java 17, 18 o 21 instalado y activo. Luego ejecuta:

```sh
./gradlew test o gradlew test
```

Esto compilará el proyecto y ejecutará todas las pruebas automatizadas.

---

- Si tienes problemas de SSL, puedes agregar la línea `* configure ssl = true` en el `Background` de tu archivo `.feature`.
- Los reportes de ejecución se generarán en la carpeta `karate-reports/`.
