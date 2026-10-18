// Tracks download and email clicks as Umami events
document.addEventListener('click', (event) => {
  const link = event.target.closest && event.target.closest('a[href]');
  if (!link || !window.umami) {
    return;
  }

  const href = link.getAttribute('href');
  const url = new URL(href, window.location.href);

  if (url.protocol === 'mailto:') {
    window.umami.track('email', { email: url.pathname });
  } else if (/\.(pdf|csv|zip|docx?|xlsx?|pptx?)$/i.test(url.pathname)) {
    window.umami.track('download', { url: url.href });
  }
}, true);
