// Theme toggle script
(function() {
  const toggleButton = document.getElementById('theme-toggle');
  const body = document.body;

  // Load user preference from localStorage
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme) {
    body.classList.add(savedTheme);
  }

  // Toggle theme on button click
  toggleButton.addEventListener('click', () => {
    if (body.classList.contains('dark-mode')) {
      body.classList.remove('dark-mode');
      body.classList.add('light-mode');
      localStorage.setItem('theme', 'light-mode');
    } else {
      body.classList.remove('light-mode');
      body.classList.add('dark-mode');
      localStorage.setItem('theme', 'dark-mode');
    }
  });
})();