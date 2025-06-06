#!/bin/bash

# Nome da pasta principal
PROJETO="evento-1711"

# Criar estrutura de diretórios
mkdir -p $PROJETO/src/assets/images
mkdir -p $PROJETO/src/assets/fonts

# Criar index.html
cat <<EOF > $PROJETO/src/index.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Evento 17/11</title>
  <link rel="stylesheet" href="./style.css">
</head>
<body>
  <header class="header">
    <h1>Evento 17/11</h1>
    <nav>
      <ul>
        <li><a href="#sobre">Sobre</a></li>
        <li><a href="#contagem">Contagem Regressiva</a></li>
        <li><a href="#inscricao">Inscreva-se</a></li>
      </ul>
    </nav>
  </header>

  <section class="hero">
    <h2>Uma celebração ao melhor de 1986</h2>
    <p>Participe deste evento inesquecível com música, cultura e nostalgia.</p>
    <a href="#inscricao" class="btn">Garanta seu lugar</a>
  </section>

  <section id="contagem" class="contador">
    <h3>Faltam:</h3>
    <div id="timer"></div>
  </section>

  <section id="sobre">
    <h3>Sobre o Evento</h3>
    <p>Comemore o dia 17/11 com uma imersão nas tendências, músicas e momentos marcantes de 1986.</p>
  </section>

  <section id="inscricao" class="form-section">
    <h3>Inscreva-se</h3>
    <form>
      <input type="text" placeholder="Seu nome" required>
      <input type="email" placeholder="Seu e-mail" required>
      <button type="submit">Enviar</button>
    </form>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Evento 17/11. Todos os direitos reservados.</p>
  </footer>

  <script src="./script.js"></script>
</body>
</html>
EOF

# Criar style.css
cat <<EOF > $PROJETO/src/style.css
:root {
  --primaria: #6c63ff;
  --secundaria: #f3f4f6;
  --texto: #111827;
  --gradiente: linear-gradient(135deg, #6c63ff, #9b5de5);
}

body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: var(--secundaria);
  color: var(--texto);
}

.header {
  background: var(--gradiente);
  padding: 1rem;
  color: white;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

nav ul {
  list-style: none;
  display: flex;
  gap: 1rem;
}

.hero {
  background: var(--gradiente);
  color: white;
  padding: 4rem 2rem;
  text-align: center;
}

.btn {
  background-color: white;
  color: var(--primaria);
  padding: 1rem 2rem;
  border: none;
  border-radius: 5px;
  margin-top: 1rem;
  text-decoration: none;
  font-weight: bold;
}

.contador {
  text-align: center;
  margin: 2rem 0;
}

#timer {
  font-size: 2rem;
  font-weight: bold;
}

.form-section {
  padding: 2rem;
  background: #fff;
  text-align: center;
}

.form-section form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  max-width: 400px;
  margin: auto;
}

.footer {
  background-color: var(--texto);
  color: white;
  text-align: center;
  padding: 1rem;
}

@media (max-width: 768px) {
  nav ul {
    flex-direction: column;
    align-items: center;
  }
}
EOF

# Criar script.js
cat <<EOF > $PROJETO/src/script.js
function atualizarContador() {
  const dataEvento = new Date("November 17, 2025 00:00:00").getTime();
  const agora = new Date().getTime();
  const tempoRestante = dataEvento - agora;

  if (tempoRestante <= 0) {
    document.getElementById("timer").innerText = "O evento começou!";
    clearInterval(intervalo);
    return;
  }

  const dias = Math.floor(tempoRestante / (1000 * 60 * 60 * 24));
  const horas = Math.floor((tempoRestante % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutos = Math.floor((tempoRestante % (1000 * 60 * 60)) / (1000 * 60));
  const segundos = Math.floor((tempoRestante % (1000 * 60)) / 1000);

  document.getElementById("timer").innerText = \`\${dias}d \${horas}h \${minutos}m \${segundos}s\`;
}

const intervalo = setInterval(atualizarContador, 1000);
EOF

# Criar package.json básico
cat <<EOF > $PROJETO/package.json
{
  "name": "evento-1711",
  "version": "1.0.0",
  "scripts": {
    "dev": "parcel src/index.html",
    "build": "parcel build src/index.html"
  },
  "devDependencies": {
    "parcel": "^2.10.0"
  }
}
EOF

# Mensagem final
echo "Estrutura da landing page criada em: $PROJETO"
echo "Execute 'cd $PROJETO && npm install && npm run dev' para iniciar o projeto."

