// Function to highlight elements temporarily
function highlightElements(selector, color = 'yellow', duration = 2000) {
  const elements = document.querySelectorAll(selector);
  if (!elements.length) {
    // console.warn(`No elements found for selector: ${selector}`);
    return;
  }

  elements.forEach(element => {
    // Save the original background color
    const originalBackground = window.getComputedStyle(element).backgroundColor;

    // Apply the highlight color
    element.style.transition = 'background-color 0.5s ease';
    element.style.backgroundColor = color;

    // Remove the highlight after the specified duration
    setTimeout(() => {
      element.style.backgroundColor = originalBackground;
    }, duration);
  });
}

// Theme toggle script
(function() {
  function updateThemeToggleText() {
    const toggleButton = document.getElementById('theme-toggle');
    if (!toggleButton) return;
    
    const body = document.body;
    if (body.classList.contains('dark-mode')) {
      toggleButton.textContent = 'Use Light Theme';
    } else {
      toggleButton.textContent = 'Use Dark Theme';
    }
  }

  function initThemeToggleButton() {
    const toggleButton = document.getElementById('theme-toggle');
    if (!toggleButton) {
      return;
    }
    
    const body = document.body;

    // Load user preference from localStorage
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      body.classList.add(savedTheme);
    }

    // Set initial button text
    updateThemeToggleText();

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
      updateThemeToggleText();
    });
  }

  document.addEventListener('DOMContentLoaded', initThemeToggleButton);

})();
