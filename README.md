# AWS-Identity-and-Access-Management-IAM-
La arquitectura de AWS Identity and Access Management (IAM) diseñada para gestionar el acceso seguro a los recursos de AWS para el personal de Recursos Humanos (RRHH) tiene varios componentes clave que aseguran que solo los usuarios autorizados puedan acceder a los recursos necesarios. A continuación, se describe esta arquitectura y su uso en detalle.
Componentes Principales
1. Política de IAM (IAM Policy)
Definición de Política: Una política de IAM es un documento JSON que define los permisos que se otorgan a los usuarios, roles o grupos de IAM. En este caso, la política específica (hr_policy.json) permite al personal de RRHH realizar acciones como listar y obtener objetos en un bucket de S3 y realizar consultas en una tabla de DynamoDB.
Propósito: La política asegura que el personal de RRHH tenga los permisos necesarios para realizar sus tareas sin otorgarles acceso innecesario a otros recursos.
2. Grupo de IAM (IAM Group)
Definición del Grupo: Un grupo de IAM (HRGroup) es una colección de usuarios de IAM. Los grupos permiten gestionar los permisos de múltiples usuarios de manera centralizada.
Asignación de Políticas: La política de IAM (HRPolicy) se adjunta al grupo, lo que significa que todos los usuarios del grupo heredan los permisos definidos en la política.
Propósito: Facilita la gestión de permisos para el personal de RRHH, asegurando que todos los miembros del grupo tengan los mismos permisos.
3. Usuarios de IAM (IAM Users)
Definición de Usuarios: Los usuarios de IAM (alice, bob, carol) son entidades individuales que representan personas o aplicaciones que necesitan acceder a los recursos de AWS.
Asignación a Grupos: Los usuarios se añaden al grupo de IAM (HRGroup), lo que les otorga automáticamente los permisos definidos en la política adjunta al grupo.
Propósito: Proporciona acceso individualizado y seguro a los recursos de AWS, permitiendo un control detallado sobre quién puede hacer qué.
4. Rol de IAM (IAM Role)
Definición del Rol: Un rol de IAM (HRRole) es una entidad de IAM que tiene un conjunto de permisos que se pueden asumir temporalmente. El rol incluye una política de confianza que define quién puede asumir el rol.
Política de Confianza: La política de confianza permite que los usuarios del grupo de RRHH asuman el rol, otorgándoles permisos adicionales si es necesario.
Propósito: Permite a los usuarios de RRHH asumir un rol con permisos específicos para realizar tareas que requieren permisos adicionales o diferentes.
Arquitectura en Terraform
Archivo main.tf
Define los recursos principales de IAM, incluyendo la política, grupo, usuarios y rol. También gestiona la asignación de políticas y la membresía de usuarios en el grupo.
Archivo variables.tf
Contiene las variables que parametrizan la configuración de Terraform, como los nombres de los usuarios, el nombre del grupo y el nombre del rol.
Archivo outputs.tf
Define las salidas que Terraform generará después de aplicar la configuración, proporcionando información útil como los ARN de la política y el rol, y los nombres de los usuarios.
Archivo hr_policy.json
Contiene el documento JSON de la política de IAM que define los permisos específicos para el personal de RRHH.
Uso de la Arquitectura
Gestión Centralizada de Permisos: Al utilizar un grupo de IAM, los permisos se gestionan de manera centralizada. Cualquier cambio en la política adjunta al grupo afecta automáticamente a todos los usuarios del grupo.
Seguridad y Control de Acceso: La política de IAM asegura que el personal de RRHH solo tenga acceso a los recursos específicos que necesitan, minimizando el riesgo de acceso no autorizado.
Flexibilidad con Roles: Los roles de IAM permiten otorgar permisos temporales adicionales a los usuarios cuando sea necesario. Esto es útil para tareas que requieren permisos elevados o diferentes.
Escalabilidad: Añadir nuevos usuarios de RRHH es sencillo. Solo se necesita crear el usuario y añadirlo al grupo, y automáticamente heredará los permisos necesarios.
Auditoría y Cumplimiento: La configuración de IAM permite un seguimiento detallado de quién accede a qué recursos y cuándo, facilitando la auditoría y el cumplimiento de normativas.
En resumen, esta arquitectura de IAM proporciona una manera segura, flexible y escalable de gestionar el acceso a los recursos de AWS para el personal de RRHH, asegurando que solo los usuarios autorizados puedan realizar las acciones necesarias.

NOTa: APROVISIONADO EN LA NUBE DE AWS FUNCIONA
