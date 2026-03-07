/**
 * Mafia Wiki — custom UI tweaks
 *
 * Hide the right sidebar when the TOC is empty
 */

;(function () {
  function checkRightSidebar() {
    var sidebar = document.querySelector(".md-sidebar--secondary")
    if (!sidebar) return

    var tocList = sidebar.querySelector(".md-nav__list")
    var isEmpty = !tocList || tocList.children.length === 0

    sidebar.classList.toggle("md-sidebar--empty", isEmpty)
  }

  // Run on load and after instant-navigation page swaps
  checkRightSidebar()

  if (typeof document$ !== "undefined") {
    document$.subscribe(function () { checkRightSidebar() })
  } else {
    document.addEventListener("DOMContentLoaded", checkRightSidebar)
    new MutationObserver(checkRightSidebar).observe(
      document.querySelector(".md-content") || document.body,
      { childList: true, subtree: true }
    )
  }
})()
