// background.js

function handleGithubContentFound(sender, sendResponse) {
  if (sender?.origin !== 'https://github.com' && sender.url != null) return;

  sendResponse({ type: 'github-url', url: sender });

  window.localStorage.setItem('github-url', sender.url);
}

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request?.type == null) return;

  switch (request.type) {
    case 'github-content-found':
      handleGithubContentFound(sender, sendResponse);
      break;
    default:
      break;
  }
});
