/**
 * Mafia Wiki — custom UI tweaks
 *
 * 1. Delay instant-preview tooltips by ~1.5 s
 * 2. Hide the right sidebar when the TOC is empty
 */

;(function () {
  /* ── 1. Tooltip delay ── */
  var DELAY = 1500          // ms before the tooltip actually appears
  var timers = new WeakMap() // tooltip element → timeout id

  var observer = new MutationObserver(function (mutations) {
    mutations.forEach(function (m) {
      if (m.type !== "attributes" || m.attributeName !== "class") return
      var el = m.target
      if (!el.classList.contains("md-tooltip")) return

      var isActive = el.classList.contains("md-tooltip--active")

      if (isActive && !el.classList.contains("md-tooltip--delayed")) {
        // Tooltip just activated — start delay
        var id = setTimeout(function () {
          if (el.classList.contains("md-tooltip--active")) {
            el.classList.add("md-tooltip--delayed")
          }
        }, DELAY)
        timers.set(el, id)
      }

      if (!isActive) {
        // Tooltip deactivated — cancel pending delay and remove class
        var pending = timers.get(el)
        if (pending) clearTimeout(pending)
        el.classList.remove("md-tooltip--delayed")
      }
    })
  })

  observer.observe(document.body, {
    attributes: true,
    attributeFilter: ["class"],
    subtree: true
  })

  /* ── 2. Hide empty right sidebar ── */
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
    // Fallback: re-check after MkDocs instant navigation
    document.addEventListener("DOMContentLoaded", checkRightSidebar)
    new MutationObserver(checkRightSidebar).observe(
      document.querySelector(".md-content") || document.body,
      { childList: true, subtree: true }
    )
  }
})()
