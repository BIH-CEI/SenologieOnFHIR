// Sprachweiche fuer die Einstiegsseiten des IG.
// Ersetzt die Fassung aus fhir2.base.template 0.1.0: dort steht das `return` in der Schleife,
// so dass nur die erste Sprache geprueft wird und Browser in jeder anderen Sprache eine leere Seite sehen.
doRedirect();

function doRedirect() {
  var userLang = (navigator.language || navigator.userLanguage || "").toLowerCase();
  var path = window.location.pathname;
  var pageName = path.substring(path.lastIndexOf('/') + 1) || "index.html";
  var target = null;
  for (var i = 0; i < langs.length; i++) {
    if (userLang == langs[i] || userLang.indexOf(langs[i] + "-") == 0) { target = langs[i]; break; }
  }
  // keine passende Browsersprache: Englisch, falls vorhanden, sonst die erste Sprache
  if (!target) { target = langs.indexOf("en") >= 0 ? "en" : langs[0]; }
  window.location.replace(target + "/" + pageName + window.location.search + window.location.hash);
}
