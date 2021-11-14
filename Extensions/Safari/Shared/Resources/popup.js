// popup.js

document.getElementById('do-something').addEventListener('click', (event) => {
  event.preventDefault();

  console.log('doing something!');
});

const mainMessage = document.getElementById('main-message');
