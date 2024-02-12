<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Login | ABC Banking</title>
    <style>
        form label sup{
            color: red;
        }
        .toast.show {
            animation-name: hide;
            animation-duration: 2s;
            opacity: 0;
        }
        @keyframes hide {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }

        }
    </style>
</head>
<body  class="vh-100 d-flex align-items-center justify-content-center">
<h2>${errorMsg}</h2>

  <form action="/login" class="p-2 text-center border p-4 rounded" method="POST">
    <h1>ABC Banking App</h1>
    <div class="mb-3">
      <label for="txt-username" class="form-label">Username</label>
      <input name="username" required type="text"
             class="form-control text-center ${denied ? 'is-invalid' : ''}" id="txt-username" placeholder="Enter your username here">
    </div>
    <div class="mb-3">
      <label for="txt-password" class="form-label">Password</label>
      <input name="password" required minlength="4" maxlength="10" type="password" class="form-control text-center ${denied ? 'is-invalid' : ''}"
             id="txt-password" placeholder="Enter your password here">
    </div>
<%--      <div class="mb-3 text-center d-flex justify-content-center">--%>
<%--          <label class="form-check-label px-2" for="switch" >Dark</label>--%>
<%--          <div class="form-check form-switch">--%>
<%--              <input name="mode" value="light" class="form-check-input" type="checkbox" role="switch" id="switch" checked>--%>
<%--              <label class="form-check-label" for="switch">Light</label>--%>
<%--          </div>--%>
<%--      </div>--%>
    <div class="mb-3">
        <div class="form-check d-flex justify-content-center">
            <input name="remember-me" class="form-check-input" type="checkbox" id="ck-remember" checked>
            <label class="form-check-label" for="ck-remember">
                Remember Me
            </label>
        </div>
    </div>


      <div>
      <button class="btn btn-primary">Sign In</button>
        <p class="pt-3 m=0">New to session app
            <a href="/sign-up">Sign Up</a>
        </p>
    </div>

  </form>
  <c:if test="${errorMsg or denied or param.get('created')}">
      <div class="${(errorMsg or denied) ? 'text-bg-danger' : 'text-bg-success'} position-fixed toast show align-items-center border-0 top-0 start-50 translate-middle-x" role="alert" aria-live="assertive" aria-atomic="true">
          <div class="d-flex">
              <div class="toast-body">
                  <c:choose>
                      <c:when test="${param.get('created')}">
                          Your account has been created successfully.
                      </c:when>
                      <c:when test="${denied}">
                          Invalid Login credentials. Try again.
                      </c:when>
                      <c:when test="${error}">
                          Something went wrong. Please try again.
                      </c:when>
                  </c:choose>

              </div>
              <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
      </div>
  </c:if>

</body>
</html>