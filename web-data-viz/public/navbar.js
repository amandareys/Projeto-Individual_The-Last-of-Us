function alterarNavbar() {
    let location = window.location.pathname;

    let links_logado = `
    <p>Olá, ${sessionStorage.NOME_USUARIO}</p>
    <p>|</p>
    <li><a href="index.html" ${location.endsWith('index.html') ? "style='color: #9d833c;'" : ""}>Home</a></li>
    <li><a href="personagens.html" ${location.endsWith('personagens.html') ? "style='color: #9d833c;'" : ""}>Personagens</a></li>
    <li><a href="criaturas.html" ${location.endsWith('criaturas.html') ? "style='color: #9d833c;'" : ""}>Criaturas</a></li>
    <li><a href="quiz.html" ${location.endsWith('quiz.html') ? "style='color: #9d833c;'" : ""}>Quiz</a></li>
    <li><a href="dashboards.html" ${location.endsWith('dashboards.html') ? "style='color: #9d833c;'" : ""}>Dashboards</a></li>
    <li><a style="cursor:pointer;" onclick="logout()" class="botao-login">Sair</a></li>
    `;
    let links_deslogado = `
    <li><a href="index.html" ${location.endsWith('index.html') ? "style='color: #9d833c;'" : ""}>Home</a></li>
    <li><a href="personagens.html" ${location.endsWith('personagens.html') ? "style='color: #9d833c;'" : ""}>Personagens</a></li>
    <li><a href="criaturas.html" ${location.endsWith('criaturas.html') ? "style='color: #9d833c;'" : ""}>Criaturas</a></li>
                    <li><a href="cadastro.html">Cadastro</a></li>
                    <li><a href="login.html" class="botao-login">Entrar</a></li>
    `
    let listaNavbar = document.getElementById("lista-navbar")
    if (sessionStorage.ID_USUARIO) {
        listaNavbar.innerHTML = links_logado
    } else {
        listaNavbar.innerHTML = links_deslogado
    }
}

function logout() {
    sessionStorage.clear()
    window.location = "index.html"
}