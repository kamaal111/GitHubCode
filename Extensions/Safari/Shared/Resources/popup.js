// popup.js

const url = window.localStorage.getItem('github-url');
if (url != null) {
  const mainMessage = document.getElementById('main-message');
  mainMessage.innerText = `Found ${url}`;
}
