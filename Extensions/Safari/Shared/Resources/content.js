// content.js

function handleGithubUrl(response) {
  console.log('Received response: ', response);
}

browser.runtime.sendMessage({ type: 'content-found' }).then((response) => {
  if (response?.type == null) return;

  switch (response.type) {
    case 'github-url':
      handleGithubUrl(response.url);
      break;
    default:
      break;
  }
});

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log('Received request: ', request);
});
