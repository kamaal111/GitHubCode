// script.js

(() => {
  if (window.top === window) {
    safari.self.addEventListener(
      'message',
      (event) => {
        if (document.hidden) {
          return;
        }
        switch (event.name) {
          case 'redirectPage':
            window.location.href = event.message.url;
            break;
          default:
            break;
        }
      },
      false,
    );

    safari.extension.dispatchMessage('pageLoaded');
  }
})();
