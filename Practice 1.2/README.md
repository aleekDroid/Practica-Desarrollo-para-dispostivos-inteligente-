**Materia:** Desarrollo para Dispositivos Inteligentes  
**Nombre del Alumno:** Alexis Vilchis Márquez  
**Semana:** 2  

---

## Enlaces del Proyecto
* **Figma Link:** [Proyecto en Figma (Can View)](https://www.figma.com/design/Rj0jQNku2S3WZTXoLrP85d/P1.2_App_Clima_Alexis_Vilchis_M%C3%A1rquez?node-id=0-1&t=E9z0QvzBXMUF2DQc-1)
* **Carpeta del Repositorio:** `practicas/p1.2/`

---

## Evidencia de los Mockups Diseñados

### Vista General del Sistema de Pantallas (Portrait y Landscape)
A continuación, se muestra el ecosistema completo con las adaptaciones responsivas para ambas orientaciones:

### Detalle de Pantalla de Información Extendida
Vista enfocada en la distribución de datos técnicos y el gráfico de comportamiento climático:

---

## Especificaciones Técnicas del Prototipo

### 1. Pantallas Desarrolladas
* **Pantalla 1: Dashboard Principal:** Contiene la ciudad, temperatura actual de 20°, estado nublado, ícono representativo y el pronóstico extendido a 3 días (Jueves, Viernes y Sábado).
* **Pantalla 2: Detalle de Ciudad:** Muestra las métricas de Humedad (64%), Viento con barra visual de intensidad, Presión atmosférica con gráfica lineal y Sensación térmica.
* **Pantalla 3: Configuración / Editar Información:** Se integraron los campos limpios para la selección de ciudad, ajuste de unidades de medida ($C/F$) y gestión de preferencias para notificaciones.

### 2. Componentes Reutilizables Definidos
Se crearon y estructuraron los siguientes componentes globales para optimizar el sistema de diseño:
1. **Tarjeta de pronóstico:** Estructura modular para los días de la semana con temperaturas máximas y mínimas.
2. **Íconos del clima:** Set de assets adaptables para indicar estados soleados, lluviosos o nublados.
3. **Flechita negra de navegación:** Componente interactivo para disparar la acción de regreso hacia las pantallas previas.

### 3. Flujo de Navegación (Prototype Mode)
* El bloque superior interactivo del Dashboard (Ciudad y temperatura) cuenta con una interacción de tipo `On click` -> `Navigate to` que direcciona a la pantalla de Detalle.
* El ícono de engranaje (configuración) conecta directamente con el menú de "Editar Información".
* Las flechas de retorno están configuradas con la acción de retroceso para mantener la coherencia en el flujo de usuario.

---

## Notas de Diseño y Accesibilidad

### Cumplimiento WCAG AA
* Se verificó la paleta de colores oscuros con tipografías claras mediante el análisis de contraste, garantizando un ratio superior al **4.5:1** requerido para asegurar una correcta legibilidad.
* Los elementos interactivos (botones, inputs de configuración y flechas de navegación) cumplen con un área táctil mínima de **48dp** para facilitar su uso en dispositivos físicos.

## Bibliografía.
Comprobador de contraste de color (AA/AAA) | Adobe Express. (s. f.). https://color.adobe.com/es/create/color-contrast-analyzer