document.addEventListener("DOMContentLoaded", () => {
    const ruta = window.location.pathname.includes("/HTML/") ? "../PHP/session.php" : "PHP/session.php";
  
    fetch(ruta)
      .then(res => res.json())
      .then(data => {
        if (data && data.usuario) {
          const btnLogin = document.getElementById("btn-login");
          const btnRegister = document.getElementById("btn-register");
          const logoutForm = document.getElementById("logout-form");
  
          if (btnLogin) btnLogin.style.display = "none";
          if (btnRegister) btnRegister.style.display = "none";
          if (logoutForm) logoutForm.style.display = "block";
        }
      });
  });
  