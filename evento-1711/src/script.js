function atualizarContador() {
  const dataEvento = new Date("November 17, 2025 00:00:00").getTime();
  const agora = new Date().getTime();
  const tempoRestante = dataEvento - agora;

  const timerEl = document.getElementById("timer");

  if (!timerEl) return;

  if (tempoRestante <= 0) {
    timerEl.innerText = "O evento começou!";
    clearInterval(intervalo);
    return;
  }

  const dias = Math.floor(tempoRestante / (1000 * 60 * 60 * 24));
  const horas = Math.floor((tempoRestante % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutos = Math.floor((tempoRestante % (1000 * 60 * 60)) / (1000 * 60));
  const segundos = Math.floor((tempoRestante % (1000 * 60)) / 1000);

  timerEl.innerText = `${dias}d ${horas}h ${minutos}m ${segundos}s`;
}

// Chamada inicial para não esperar 1 segundo para aparecer o contador
atualizarContador();

// Atualiza a cada segundo
const intervalo = setInterval(atualizarContador, 1000);
