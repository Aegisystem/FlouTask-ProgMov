# FlouTask
Aplicación para la gestión de proyectos, tareas y objetivos con trabajo colaborativo (Real-time)

# 1. STACK TECNOLÓGICO.

# FLUTTER →

## **Descripción**

Flutter es un framework de desarrollo de aplicaciones móviles de código abierto creado por Google. Permite construir aplicaciones nativas de alta calidad para iOS y Android desde una única base de código. En esta guía, aprenderemos cómo instalar Flutter en tu máquina para que puedas comenzar a desarrollar aplicaciones móviles con facilidad.

## **Proceso de instalación**

### **Paso 1: Requisitos del sistema**

Antes de instalar Flutter, asegúrate de que tu máquina cumpla con los siguientes requisitos:

- **Sistema operativo**: Flutter es compatible con Windows, macOS y Linux. Verifica que tu sistema operativo sea compatible.
- **Espacio en disco**: Asegúrate de tener al menos 400 MB de espacio libre en disco.
- **Herramientas de línea de comandos**: Flutter utiliza la línea de comandos para varias tareas, por lo que es importante tener herramientas de línea de comandos instaladas y configuradas correctamente en tu sistema.

### **Paso 2: Descarga de Flutter**

1. Ve al sitio web oficial de Flutter en **[https://flutter.dev/](https://flutter.dev/)** y haz clic en el botón "Get started" o "Comenzar".
2. Selecciona tu sistema operativo y descarga el paquete de instalación de Flutter correspondiente.
3. Extrae el contenido del paquete descargado en una ubicación deseada en tu máquina. Por ejemplo, puedes extraerlo en **`C:\flutter`** (Windows) o **`/usr/local/flutter`** (macOS o Linux).

### **Paso 3: Configuración del entorno**

1. Agrega la ruta de Flutter a la variable de entorno **`PATH`** para que puedas acceder a los comandos de Flutter desde cualquier ubicación en la línea de comandos.
    - **Windows**:
        - Abre la configuración del sistema.
        - Haz clic en "Configuración avanzada del sistema" y luego en "Variables de entorno".
        - Busca la variable de entorno "Path" en la sección "Variables del sistema" y haz clic en "Editar".
        - Agrega la ruta de Flutter (por ejemplo, **`C:\flutter\bin`**) al final de la lista separada por punto y coma (;).
    - **macOS/Linux**:
        - Abre una terminal.
        - Ejecuta el siguiente comando para abrir el archivo de perfil: **`sudo nano $HOME/.bash_profile`**
        - Agrega la siguiente línea al final del archivo: **`export PATH="$PATH:/usr/local/flutter/bin"`**
        - Guarda los cambios y cierra el archivo.
        - Ejecuta el siguiente comando para cargar los cambios de la configuración: **`source $HOME/.bash_profile`**
2. Verifica la instalación ejecutando el siguiente comando en una terminal: **`flutter doctor`**. Esto verificará si hay alguna dependencia faltante o configuración incorrecta y te proporcionará instrucciones adicionales si es necesario.

### **Paso 4: Configuración del editor de código**

Para desarrollar aplicaciones Flutter de manera eficiente, es recomendable utilizar un editor de código con soporte para Flutter. Aquí hay algunas opciones populares:

- **Visual Studio Code**: Descarga e instala Visual Studio Code desde **[https://code.visualstudio.com/](https://code.visualstudio.com/)**. Luego, instala la extensión "Flutter" en Visual Studio Code desde el mercado de extensiones.
- **Android Studio**: Descarga e instala Android Studio desde **[https://developer.android.com/studio/](https://developer.android.com/studio/)**.

# MONGO DB + ALTAS →

## **Descripción**

MongoDB es una base de datos NoSQL de código abierto que proporciona un alto rendimiento, escalabilidad y flexibilidad para el almacenamiento y la gestión de datos. MongoDB Atlas es el servicio de base de datos en la nube ofrecido por MongoDB, que permite alojar y gestionar bases de datos MongoDB de forma sencilla. En esta guía, aprenderemos cómo instalar MongoDB localmente y cómo utilizar MongoDB Atlas para alojar bases de datos en la nube.

## **Proceso de instalación**

### **Paso 1: Descarga de MongoDB**

1. Ve al sitio web oficial de MongoDB en **[https://www.mongodb.com/](https://www.mongodb.com/)** y haz clic en el botón "Try Free" o "Probar Gratis".
2. Selecciona la opción de descarga correspondiente a tu sistema operativo (Windows, macOS o Linux).
3. Sigue las instrucciones proporcionadas en el sitio web para descargar el paquete de instalación de MongoDB.

### **Paso 2: Instalación de MongoDB**

1. Ejecuta el paquete de instalación descargado y sigue las instrucciones del asistente de instalación.
2. Durante la instalación, se te preguntará si deseas instalar MongoDB Compass, una interfaz gráfica para administrar y visualizar bases de datos MongoDB. Puedes seleccionar esta opción si lo deseas.
3. Configura la ruta de instalación y otros parámetros según tus preferencias.
4. Finaliza la instalación.

### **Paso 3: Configuración del entorno**

1. Agrega la ruta de MongoDB a la variable de entorno **`PATH`** para poder acceder a los comandos de MongoDB desde cualquier ubicación en la línea de comandos.
    - **Windows**:
        - Abre la configuración del sistema.
        - Haz clic en "Configuración avanzada del sistema" y luego en "Variables de entorno".
        - Busca la variable de entorno "Path" en la sección "Variables del sistema" y haz clic en "Editar".
        - Agrega la ruta de MongoDB (por ejemplo, **`C:\Program Files\MongoDB\Server\4.4\bin`**) al final de la lista separada por punto y coma (;).
    - **macOS/Linux**:
        - Abre una terminal.
        - Ejecuta el siguiente comando para abrir el archivo de perfil: **`sudo nano $HOME/.bash_profile`**
        - Agrega la siguiente línea al final del archivo: **`export PATH="/usr/local/mongodb/bin:$PATH"`**
        - Guarda los cambios y cierra el archivo.
        - Ejecuta el siguiente comando para cargar los cambios de la configuración: **`source $HOME/.bash_profile`**

### **Paso 4: Uso de MongoDB Atlas**

1. Ve al sitio web oficial de MongoDB Atlas en **[https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)** y crea una cuenta si aún no tienes una.
2. Inicia sesión en MongoDB Atlas con tus credenciales.
3. Crea un nuevo proyecto en MongoDB Atlas y sigue las instrucciones proporcionadas para configurar un clúster de base de datos en la nube.
4. Configura las opciones de tu clúster, como la ubicación geográfica, el tamaño de la instancia y las opciones de seguridad.
5. Una vez que tu clúster esté configurado y en funcionamiento, podrás conectarte a él utilizando una cadena de conexión proporcionada por MongoDB Atlas. Puedes usar esta cadena de conexión en tu aplicación para conectarte a la base de datos en la nube.

# ELK STACK →

## **Descripción**

Elasticsearch es un motor de búsqueda y análisis distribuido de código abierto que se utiliza para almacenar, buscar y analizar grandes volúmenes de datos en tiempo real. Junto con Kibana y Logstash, forma el stack de Elasticsearch (conocido como ELK stack), que proporciona capacidades de recopilación, almacenamiento, búsqueda y visualización de datos. En esta guía, aprenderemos cómo instalar y configurar Elasticsearch, Kibana y Logstash para utilizar el stack de Elasticsearch.

## **Proceso de instalación**

### **Paso 1: Descarga de Elasticsearch**

1. Ve al sitio web oficial de Elasticsearch en **[https://www.elastic.co/downloads/elasticsearch](https://www.elastic.co/downloads/elasticsearch)** y descarga la versión correspondiente a tu sistema operativo.
2. Selecciona el formato de archivo que prefieras (por ejemplo, .zip o .tar.gz) y descarga el paquete de instalación de Elasticsearch.

### **Paso 2: Instalación de Elasticsearch**

1. Extrae el contenido del paquete descargado en una ubicación deseada en tu máquina.
2. Abre una terminal o línea de comandos y navega hasta el directorio donde se extrajo Elasticsearch.
3. Ejecuta el comando **`./bin/elasticsearch`** en Linux/Mac o **`.\bin\elasticsearch.bat`** en Windows para iniciar Elasticsearch.

### **Paso 3: Descarga de Kibana**

1. Ve al sitio web oficial de Kibana en **[https://www.elastic.co/downloads/kibana](https://www.elastic.co/downloads/kibana)** y descarga la versión correspondiente a tu sistema operativo.
2. Selecciona el formato de archivo que prefieras (por ejemplo, .zip o .tar.gz) y descarga el paquete de instalación de Kibana.

### **Paso 4: Instalación de Kibana**

1. Extrae el contenido del paquete descargado en una ubicación deseada en tu máquina.
2. Abre una terminal o línea de comandos y navega hasta el directorio donde se extrajo Kibana.
3. Edita el archivo de configuración **`config/kibana.yml`** para configurar la conexión con Elasticsearch. Busca la línea que comienza con **`elasticsearch.hosts`** y especifica la URL de Elasticsearch (por ejemplo, **`http://localhost:9200`**).
4. Ejecuta el comando **`./bin/kibana`** en Linux/Mac o **`.\bin\kibana.bat`** en Windows para iniciar Kibana.

### **Paso 5: Descarga de Logstash**

1. Ve al sitio web oficial de Logstash en **[https://www.elastic.co/downloads/logstash](https://www.elastic.co/downloads/logstash)** y descarga la versión correspondiente a tu sistema operativo.
2. Selecciona el formato de archivo que prefieras (por ejemplo, .zip o .tar.gz) y descarga el paquete de instalación de Logstash.

### **Paso 6: Instalación de Logstash**

1. Extrae el contenido del paquete descargado en una ubicación deseada en tu máquina.
2. Abre una terminal o línea de comandos y navega hasta el directorio donde se extrajo Logstash.

### **Paso 7: Configuración del stack de Elasticsearch**

1. Asegúrate de que Elasticsearch esté en funcionamiento ejecutando el comando **`curl http://localhost:9200`** en una terminal. Deberías ver una respuesta JSON que confirme que Elasticsearch está en ejecución.
2. Verifica que Kibana esté en funcionamiento abriendo un navegador web y accediendo a **`http://localhost:5601`**. Deberías ver la interfaz de usuario de Kibana.
3. Configura Logstash para enviar datos a Elasticsearch. Puedes crear un archivo de configuración **`.conf`** en Logstash para definir las fuentes de datos y las transformaciones necesarias. Consulta la documentación oficial de Logstash para obtener más detalles sobre la configuración.

# Firabase Storage →

## **Descripción**

Firebase Storage es un servicio en la nube proporcionado por Firebase, que permite almacenar y compartir archivos en aplicaciones web y móviles. En esta guía, aprenderemos cómo configurar Firebase Storage para tu proyecto y cómo utilizarlo para almacenar y recuperar archivos.

## **Proceso de configuración**

### **Paso 1: Crear un proyecto en Firebase**

1. Ve al sitio web oficial de Firebase en **[https://firebase.google.com/](https://firebase.google.com/)** y crea una cuenta o inicia sesión si ya tienes una.
2. Haz clic en "Ir a la consola" y luego en "Agregar proyecto" para crear un nuevo proyecto en Firebase.
3. Asigna un nombre a tu proyecto y selecciona la configuración regional que prefieras.
4. Haz clic en "Crear proyecto" para crear el proyecto en Firebase.

### **Paso 2: Habilitar Firebase Storage**

1. Una vez que tu proyecto esté creado, en la consola de Firebase, selecciona tu proyecto.
2. En el menú lateral izquierdo, haz clic en "Almacenamiento" para acceder a la sección de Firebase Storage.
3. Haz clic en el botón "Comenzar" para habilitar Firebase Storage en tu proyecto.
4. Asegúrate de leer y comprender los términos de uso de Firebase Storage y haz clic en "Entendido" para continuar.

### **Paso 3: Configurar reglas de seguridad**

1. En la sección de Firebase Storage, haz clic en la pestaña "Reglas".
2. Por defecto, las reglas de seguridad están configuradas para permitir que cualquier usuario pueda leer y escribir en Firebase Storage. Puedes personalizar estas reglas según tus necesidades de seguridad.
3. Consulta la documentación de Firebase para aprender más sobre cómo configurar reglas de seguridad en Firebase Storage.

### **Paso 4: Configurar SDK de Firebase**

1. Haz clic en el botón "Configuración del proyecto" en la parte superior de la consola de Firebase.
2. En la pestaña "General", desplázate hacia abajo hasta la sección "SDK de Firebase" y haz clic en el botón "Añadir aplicación".
3. Sigue las instrucciones proporcionadas para registrar tu aplicación en Firebase.
4. Descarga el archivo de configuración **`google-services.json`** (para Android) o **`GoogleService-Info.plist`** (para iOS) y guárdalo en una ubicación segura.

### **Paso 5: Integra Firebase Storage en tu aplicación**

1. Abre tu proyecto de desarrollo en el entorno de desarrollo que estés utilizando (por ejemplo, Android Studio para aplicaciones Android).
2. Agrega la dependencia de Firebase Storage a tu proyecto siguiendo las instrucciones proporcionadas en la documentación oficial de Firebase para tu plataforma específica.
3. Configura tu aplicación para utilizar el archivo de configuración **`google-services.json`** o **`GoogleService-Info.plist`** que descargaste en el paso anterior.
4. Sigue las instrucciones de Firebase para inicializar Firebase Storage en tu aplicación y comenzar a utilizarlo para almacenar y recuperar archivos.

# 2. Requerimientos No Funcionales & Diagrama de Despliegue

### REQUERIMIENTOS NO FUNCIONALES →

- La aplicación debe entrar en funcionamiento en el menor tiempo posible, pues se tiene la fecha límite para julio de este año.
- Las búsquedas en la app deben ser eficientes y facilitar el uso para el usuario mediante recomendaciones
- El tiempo de respuesta de la aplicación no debe exceder los 2 segundos.
- El presupuesto debe ser manejado de manera eficiente, para garantizar la rentabilidad del proyecto.
- La aplicación debe ser capaz de manejar un alto volumen de usuarios y proyectos, sin disminuir su rendimiento y calidad.
- Se requiere una infraestructura adecuada que permita el crecimiento sostenible de la empresa.
- Se deberá utilizar **Flutter** para el desarrollo de la aplicación móvil, que permite la creación de aplicaciones móviles nativas y también permite la creación de aplicaciones móviles híbridas.
- Se deberá utilizar **MongoDB + Atlas** para el almacenamiento y consulta de datos estructurados y no estructurados.
- La aplicación debe ser rápida y eficiente en el procesamiento de los datos y acciones de los usuarios, con tiempos de respuesta cortos y una gestión adecuada de la carga para ofrecer una experiencia satisfactoria.
- La aplicación debe contar con una interfaz intuitiva y accesible, facilitando su uso y comprensión por parte de los usuarios.
- Es importante que el código de la aplicación sea fácil de entender y mantener, con una arquitectura bien definida y una documentación clara.
- La aplicación debe ser capaz de manejar una gran cantidad de usuarios y proyectos sin disminuir su rendimiento y calidad.
- Es esencial que la aplicación esté disponible y accesible en todo momento, contando con una infraestructura robusta y tolerante a fallos.
- La aplicación debe garantizar la seguridad de los datos de los usuarios y los proyectos, contando con medidas de protección y prevención adecuadas.
- La aplicación debe ser consistente y confiable en su funcionamiento, gestionando adecuadamente los errores y excepciones para ofrecer una alta calidad en su rendimiento.
- La aplicación debe ser rápida y eficiente en el procesamiento de los datos y acciones de los usuarios, con tiempos de respuesta cortos y una gestión adecuada de la carga para ofrecer una experiencia satisfactoria.

### DIAGRAMA DE DESPLIEGUE →

![Diagrama Despliegue](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Diagrama_Despliegue.drawio_(2).png)

# 3. Requerimientos Funcionales & Casos de uso

### REQUERIMIENTOS FUNCIONALES →

- La aplicación debe permitir a los usuarios crear y asignar tareas a otros miembros del equipo.
- La aplicación debe permitir a los usuarios establecer plazos para la finalización de las tareas.
- La aplicación debe enviar notificaciones de recordatorio a los usuarios para asegurarse de que los plazos se cumplan.
- La aplicación debe tener una interfaz de usuario intuitiva y fácil de usar.
- La aplicación debe permitir a los usuarios personalizar la aplicación según sus necesidades.
- La aplicación debe generar alertas para informar a los usuarios de cualquier problema con los proyectos y tareas.
- La aplicación debe generar un resumen de los proyectos con su respectivo progreso.
- La aplicación debe permitir a los usuarios cargar archivos en las tareas y proyectos.
- La aplicación debe tener un buscador que permita a los usuarios buscar a través de toda la aplicación, incluyendo tareas, proyectos y archivos.
- Los usuarios deben poder trabajar en tiempo real.

### DIAGRAMAS DE CASOS DE USO →

![Diagrama de caso de uso 1](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Diagrama_de_caso_de_uso.png)

![Diagrama de caso de uso 2](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Diagrama_de_caso_de_uso_(1).png)

![Diagrama de caso de uso 3](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Diagrama_de_caso_de_uso_(3).png)

![Diagrama de caso de uso 4](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Diagrama_de_caso_de_uso_(4).png)  

# 4. Mockups

![Mockup 1](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Untitled.png)

![Mockup 2](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Untitled%201.png)

![Mockup 3](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Untitled%202.png)

![Mockup 4](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Untitled%203.png)

![Mockup 5](https://raw.githubusercontent.com/Aegisystem/FlouTask/main/Assets/Untitled%204.png)#   F l o u T a s k - P r o g M o v  
 