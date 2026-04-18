# Proyecto-Final-grupo-1
Esta API permite gestionar citas médicas entre pacientes y médicos. El sistema valida la disponibilidad del médico, la especialidad requerida y la duración de la consulta antes de confirmar una cita

## Lógica de negocio
Un médico puede tener una o más especialidades.
Un paciente puede solicitar una cita indicando fecha y hora.
El sistema valida:
Disponibilidad del médico.
Correspondencia entre especialidad y médico.
Duración adecuada de la consulta.



## Integrantes
Caleb Alexander Ávalos Ramírez AR18012
Marcela de Los Ángeles Quinteros García QG24003



## Tecnologías utilizadas
Python
Git
GitHub



## Ejecución del proyecto
Clonar el repositorio:
git clone https://github.com/usuario/api-citas-medicas.git
Entrar al proyecto:
cd api-citas-medicas
Instalar dependencias:
pip install -r requirements.txt
Ejecutar:
python app.py



## Estructura del proyecto
app.py: archivo principal
models/: modelos de datos (médicos, pacientes, citas)
routes/: endpoints de la API
services/: lógica de negocio
.gitignore: archivos ignorados
README.md: documentación



## Validaciones implementadas
Validación de opción del menú:
Se controla que el usuario ingrese una opción válida dentro del menú principal (1 a 4). En caso contrario, se muestra un mensaje de error.
Validación de especialidad del médico:
Se verifica que la especialidad solicitada por el paciente coincida con la especialidad del médico seleccionado antes de agendar la cita.
Validación de disponibilidad del médico:
Se comprueba si el médico está disponible en la fecha y hora solicitadas antes de confirmar la cita.
Validación conjunta para agendar cita:
La cita solo se agenda si:
El médico está disponible y la especialidad es válida
En caso contrario, se muestra un mensaje de error.
Validación básica de entrada de datos:
Se solicita al usuario ingresar datos como nombre, especialidad, fecha y hora para registrar médicos, pacientes y citas.
