# 📘 Diccionario de Datos – Plantilla General
       //Doctores
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `ID-Doctor`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        | -Numero de doctor para encontra un registro                                            
| `nombre`        | NVARCHAR             | 100    | ❌  | ❌  | ❌   | ✅     |             | -                                |              |
| `Especialidad`          | NVARCHAR       | 100      | ❌  | ❌  | ❌   | ✅     |          | -        Especialidad de el doctor                                             
                             



        // Atiende

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `ID-Doctor`     | INT          | -      | ❌  | ✅   | ❌ | ✅     |                                         | -                                | Identificador del doctor               |
| `ID-Paciente`        | VARCHAR      | 100    | ❌  | ✅  | ❌   | ✅     |            | -                                | Numero del Paciente            |
| `Fecha`          | DATE         | -    10  | ❌  | ❌ | ❌   | ❌     | Fecha del tratamiento        | 
| `Diagnostico`          | DATE         | -  10    | ❌  | ❌ | ❌   | ✅     | Diagnostico del tratamiehto         | -                                |                        |

       //Paciente

       
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `ID-Paciente`     | INT          | 15      | ✅  | ❌  | ❌   | ✅     |                                        |    registro                                            
| `Nombres`        | NVARCHAT             | 100    | ❌  | ❌ | ❌   | ✅     |             | -                                |              |
| `Apellido1`          | VARCHAR       | 20      | ❌  | ❌  | ❌   | ❌     |          | -                                                       
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ✅    | ❌     |    
 
