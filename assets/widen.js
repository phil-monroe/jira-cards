Array.prototype.filter.call(
  document.querySelectorAll('.main-content'),
  function(element) {
    return element.scrollHeight > element.clientHeight;
  }
).map(function(element) {
  return element.closest('.story');
}).forEach(function(storyElement) {
  storyElement.classList.add('wide');
  storyParent = storyElement.parentElement;
  storyParent.insertBefore(storyElement, storyParent.firstElementChild);
})
