// background.js

function handleContentFound(sender, sendResponse) {
  if (sender?.origin !== 'https://github.com' && sender.url != null) return;

  sendResponse({ type: 'github-url', url: sender });

  // TODO: Save url somewhere
}

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request?.type == null) return;

  switch (request.type) {
    case 'content-found':
      handleContentFound(sender, sendResponse);
      break;
    default:
      break;
  }
});
