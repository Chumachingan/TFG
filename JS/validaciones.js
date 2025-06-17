// Script para validación de formularios de registro y login

document.addEventListener("DOMContentLoaded", function () {
    // Obtiene referencias a los formularios
    const registroForm = document.querySelector('form[action="PHP/registro.php"]');
    const loginForm = document.querySelector('form[action="PHP/login.php"]');

    // Configura validaciones para el formulario de registro
    if (registroForm) {
        registroForm.addEventListener("submit", function (e) {
            if (!validarFormularioRegistro(this)) {
                e.preventDefault();
                alert("Corrige los errores del formulario de registro.");
            }
        });
        añadirEventosTiempoReal(registroForm);
    }

    // Configura validaciones para el formulario de login
    if (loginForm) {
        loginForm.addEventListener("submit", function (e) {
            if (!validarFormularioLogin(this)) {
                e.preventDefault();
                alert("Corrige los errores del formulario de inicio de sesión.");
            }
        });
        añadirEventosTiempoReal(loginForm);
    }

    // Funciones de validación
    function validarFormularioRegistro(form) {
        const nombre = form.querySelector('input[name="nombre_usuario"]');
        const email = form.querySelector('input[name="email"]');
        const password = form.querySelector('input[name="password"]');

        let valido = true;

        if (!nombre.value.trim()) {
            mostrarError(nombre, "Este campo es obligatorio.");
            valido = false;
        } else {
            limpiarError(nombre);
        }

        if (!/^[^@]+@[^@]+\.[^@]+$/.test(email.value)) {
            mostrarError(email, "Correo no válido.");
            valido = false;
        } else {
            limpiarError(email);
        }

        if (!/^(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{8,}$/.test(password.value)) {
            mostrarError(password, "Mín. 8 caracteres, 1 mayúscula, 1 número y 1 símbolo.");
            valido = false;
        } else {
            limpiarError(password);
        }

        return valido;
    }

    function validarFormularioLogin(form) {
        const nombre = form.querySelector('input[name="nombre_usuario"]');
        const password = form.querySelector('input[name="password"]');
        let valido = true;

        if (!nombre.value.trim()) {
            mostrarError(nombre, "Este campo es obligatorio.");
            valido = false;
        } else {
            limpiarError(nombre);
        }

        if (!password.value.trim()) {
            mostrarError(password, "Este campo es obligatorio.");
            valido = false;
        } else {
            limpiarError(password);
        }

        return valido;
    }

    // Funciones de UI para mostrar/ocultar errores
    function mostrarError(input, mensaje) {
        input.classList.add("input-error");
        input.classList.remove("input-ok");

        let msg = input.parentNode.querySelector('.error-message');
        if (!msg) {
            msg = document.createElement('small');
            msg.className = 'error-message';
            input.parentNode.appendChild(msg);
        }
        msg.textContent = mensaje;
    }

    function limpiarError(input) {
        input.classList.remove("input-error");
        input.classList.add("input-ok");

        const msg = input.parentNode.querySelector('.error-message');
        if (msg) msg.remove();
    }

    // Validación en tiempo real mientras el usuario escribe
    function añadirEventosTiempoReal(form) {
        form.querySelectorAll("input").forEach(input => {
            input.addEventListener("input", () => {
                if (input.name === "email") {
                    /^[^@]+@[^@]+\.[^@]+$/.test(input.value)
                        ? limpiarError(input)
                        : mostrarError(input, "Correo no válido.");
                } else if (input.name === "password" && form.action.includes("registro")) {
                    /^(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{8,}$/.test(input.value)
                        ? limpiarError(input)
                        : mostrarError(input, "Mín. 8 caracteres, 1 mayúscula, 1 número y 1 símbolo.");
                } else {
                    input.value.trim()
                        ? limpiarError(input)
                        : mostrarError(input, "Este campo es obligatorio.");
                }
            });
        });
    }
});

  window.onload = function () {
    const params = new URLSearchParams(window.location.search);

    if (params.get("error") === "1") {
      // Mostrar el modal manualmente
      const modal = document.getElementById("loginModal");
      if (modal) {
        modal.style.display = "block";
      }

      // Insertar mensaje de error dentro del modal
      const errorDiv = document.getElementById("login-error");
      if (errorDiv) {
        errorDiv.textContent = "⚠️ Usuario o contraseña incorrectos.";
      }
    }
  };
