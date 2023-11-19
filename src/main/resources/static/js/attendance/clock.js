/*const clock = document.querySelector("h1");
const dateElement = document.querySelector("#date");

function getClock() {
  const d = new Date();
  const year = d.getFullYear();
  const month = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  const date = `${year}-${month}-${day}`;

  dateElement.innerText = date;
}

getClock(); // Initial execution
setInterval(getClock, 1000);*/


const clock = document.querySelector("h1");
const dateElement = document.querySelector("#date");

function getClock() {
  const d = new Date();
  const year = d.getFullYear();
  const month = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  const date = `${year}-${month}-${day}`;

  clock.innerText = getFormattedTime();
  dateElement.innerText = date;
}

function getFormattedTime() {
  const d = new Date();
  const h = String(d.getHours()).padStart(2, "0");
  const m = String(d.getMinutes()).padStart(2, "0");
  const s = String(d.getSeconds()).padStart(2, "0");
  return `${h}:${m}:${s}`;
}

getClock(); // Initial execution
setInterval(getClock, 1000);
