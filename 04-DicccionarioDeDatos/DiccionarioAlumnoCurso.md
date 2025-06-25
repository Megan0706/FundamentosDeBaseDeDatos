# 📘 Diccionario de Datos – Plantilla General
       //Alumno
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumAlum`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        | -Numero de registro del alumno                                           
| `Nombre`        | VARCHAR            | 100    | ❌  | ❌  | ❌   | ✅     |             | -                                |              |
| `Apellido1`          | VARCHAR       | 100      | ❌  | ❌  | ❌   | ✅     |          | -        Titulo del libro como un identificador                                               
| `Apellido2`        | VARCHAR      | 150    | ❌  | ❌  | ✅   | ✅     |                   |                                 | 



        // Participa

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumAlumno`     | INT          | -      | ❌  |  ✅ | ❌   | ✅     |                                         | -                                | Identificador del cliente               |
| `NumCurso`        | VARCHAR      | 100    | ❌  | ✅  | ❌   | ✅     |            | -                                | Numero del Lector            |
| `Horas`          | INT       | -      | ❌  | ❌  | ❌   | ✅     | Fecha del prestamo registro         | 
| `Fecha Curso`        | DATE     | 20    | ❌  | ❌  | ❌     | ✅      |    
                                |                        |
-




       //Curso

       
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCurso`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        |    registro                                            
| `Nombre`        | VARCHAR            | 100    | ❌  | ❌   | ❌   | ✅     |             | -                                |              |


        //Ubicacion
 
     

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `UbicacionId`     | INT          | -      | ✅  |  ❌ | ❌   | ✅     |                                         | -                                | Identificador de la ubicacion               |
| `NumCurso`        | VARCHAR      | 100    | ❌  | ✅  | ❌   | ✅     |            | -                                | Numero del curso            |
| `UbicacionCurso`          |NVARCHAR       |100     | ❌  | ❌  | ❌   | ✅     | Lugar del curso         | 



